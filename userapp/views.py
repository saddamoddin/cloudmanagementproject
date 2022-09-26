from asyncio.windows_events import NULL
import re
from django.shortcuts import render,redirect
from django.shortcuts import get_list_or_404, get_object_or_404
from userapp.models import UserRegisterModel, UserRequestRightModel
from django.contrib import messages
import random
import requests
from userapp.models import AccessControlModel
from userapp.models import fileUploadModel
from django.db.models import Q

# Create your views here.


def user_register(request):

    if request.method == "POST":
        name=request.POST.get('name')
        email=request.POST.get('email')
        mobile=request.POST.get('mobile')
        category=request.POST.get('category')
        pwd=request.POST.get('pwd')
        cpwd=request.POST.get('cpwd')

        if UserRegisterModel.objects.filter(email=email):
            messages.error(request,"Email ALready Exists!")

        else:
            otp=random.randint(1111,9999)
            url = "https://www.fast2sms.com/dev/bulkV2"
            # create a dictionary
            my_data = {'sender_id': 'FSTSMS', 
                        'message': 'Welcome to CloudHost, your verification OPT is '+str(otp)+ 'Thanks for request of OTP.', 
                        'language': 'english', 
                        'route': 'p', 
                        'numbers': mobile
            }

            # create a dictionary
            headers = {
                'authorization': 'D4vuFnk1sNQOl6SRpfZUT23ewPX0BoLrzAJVgqtW8bxyHEGjImfkE0NtULg1TG9xImYHpVZjQMnBSOoa',
                'Content-Type': "application/x-www-form-urlencoded",
                'Cache-Control': "no-cache"
            }
            # make a post request
            response = requests.request("POST",
                                        url,
                                        data = my_data,
                                        headers = headers)
            # print the send message
            print(response.text)        

            UserRegisterModel.objects.create(name=name,email=email,mobile=mobile,category=category,pwd=pwd,cpwd=cpwd,otp=otp)
            messages.success(request,'Account Created Successfully!')
            return redirect('user-otp')

    return render(request,'main/user-register.html')

def user_register(request):
    if request.method == "POST" and 'profile' in request.FILES:
        name = request.POST.get('name')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        state = request.POST.get('state')
        birth = request.POST.get('birth')
        profile = request.FILES ['profile']
        password = request.POST.get('password')
        if UserRegisterModel.objects.filter(user_email=email):
            messages.error(request,"Email  Already  Exists!")
        else:
            print("vssdvsdvsd")
            
           
       
       
       
       
    return render(request,"user/user-register.html")


def user_file_edit(request,id):
    file_data = fileUploadModel.objects.get(file_id=id)
    f = open("media/files/" + str(file_data.file),"r")
    file = f.read()
    f.close()
    print(file)


    file_id=fileUploadModel.objects.get(file_id=id)
    print(file_id)

    if request.method == "POST":
        print('--------------------------------')
        usertext=request.POST.get('file_text')
        filename=request.POST.get('file_name')
        f=open('media/files/'+str(file_data.file),'w')
        print(f)
        f.write(usertext)
        print(f)
        f.close()

        fileUploadModel.objects.filter(file_id=id).update(file=filename)
        return redirect('user-file-download')

    
    return render(request,"user/user-file-edit.html",{'file_data':file_data,"file":file})


def otp(request):
    if request.method == "POST":
        otp = request.POST.get('otp')
        try:
            check = UserRegisterModel.objects.get(otp=otp)
            user_id = request.session['user_id']=check.user_id
            otp=check.otp
            if otp == otp:
                messages.info(request,'Account Created Successfully!')
                return redirect('user-login')    
        except:
            messages.error(request,'The OTP you entered is incorrect.Please try again.')
            print('The OTP you entered is incorrect.Please try again.')
            return redirect('user-otp')
    return render(request,'user/user-otp.html')


def user_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        print(email)
        password = request.POST.get('password')
        print(password)

        try:
            check = UserRegisterModel.objects.get(user_email=email,user_password=password)
            print(check)
            request.session["user_id"] = check.user_id
            activation = check.token_no
            
            if activation == None:
               
                messages.error(request,"Your account is not activated yet")
                return redirect('user-login')
            else:
                return redirect('user-token')

        except:
            messages.error(request,"Invalid username or password")
            return redirect('user-login')

    return render(request,"user/user-login.html")

def user_token(request):
    if request.method == "POST":
        token_no = request.POST.get('token')
        try:
            check = UserRegisterModel.objects.get(token_no=token_no)
            request.session["user_id"] = check.user_id
            return redirect('user-index')

        except:
            messages.error(request,'The Token Number you entered is incorrect.Please try again.')
            return redirect('user-token')
    return render(request,"user/user-token.html")



def user_index(request):
    user_id = request.session['user_id']
    users=UserRegisterModel.objects.count()
    files=fileUploadModel.objects.count()
    result = AccessControlModel.objects.get(user_id = user_id)
    print(result.user_upload)
    print(result.user_update)
    print(result.user_download)
    count=0
    print(count)
    if result.user_upload == "YES":
        count += 1
    if result.user_update == "YES":
        count += 1
    if result.user_download == "YES":
        count += 1
    return render(request,"user/user-index.html",{'user':users,'files':files,'permission':count})



def user_profile(request):
    user_id = request.session["user_id"]
    data = UserRegisterModel.objects.filter(user_id = user_id)
    obj = get_object_or_404(UserRegisterModel,user_id = user_id)
   
    if request.method == "POST":
        user_name = request.POST['name']
        user_email = request.POST['email']
        user_contact = request.POST['contact']
        user_state = request.POST['state']
        user_dob = request.POST['birth']

        if len(request.FILES) != 0:
            user_profile = request.FILES['user_profile']
            obj.user_name = user_name
            obj.user_email = user_email
            obj.user_contact = user_contact
            obj.user_state = user_state
            obj.user_dob = user_dob
            obj.user_profile = user_profile
            obj.save(update_fields = ['user_name','user_email', 'user_contact', 'user_state','user_dob','user_profile'])
            obj.save()
            messages.info(request,"Details Updated Successfully!")
            return redirect('user-profile')
        else:
            obj.user_name = user_name
            obj.user_email = user_email
            obj.user_contact = user_contact
            obj.user_state = user_state
            obj.user_dob = user_dob
            obj.save(update_fields=['user_name','user_email', 'user_contact', 'user_state','user_dob'])
            obj.save()
            messages.info(request,"Details Updated Successfully!")
            return redirect('user-profile')
    return render(request, 'user/user-profile.html',{'data':data})

  

def user_file_rights(request):
    user_id = request.session['user_id']
    data = UserRegisterModel.objects.get(user_id = user_id)
    user_rights = AccessControlModel.objects.get(user_id = user_id)
    return render(request,'user/user-file-rights.html',{'rights': user_rights,'data':data})

def user_file_upload(request):
    user_id = request.session['user_id']
    data = UserRegisterModel.objects.get(user_id = user_id)
    user_name = data.user_name
    print(user_id)
    user_rights = AccessControlModel.objects.get(user_id = user_id)
    print(user_rights.user_upload)
    if request.method == "POST" and 'file' in request.FILES:
        if user_rights.user_upload == "YES":
            file = request.FILES['file']
            file_name=file.name
            file_size=file.size
            print(file_size)
            file_type=file.content_type
            print(file_type)
        if fileUploadModel.objects.filter(file_name=file_name):
            messages.error(request,'File Already Exists!')
        else:
            fileUploadModel.objects.create(user_id=user_id,user_name=user_name,file=file,file_name=file_name,file_size=file_size,file_type=file_type)
            messages.info(request,'File Uploaded Successfully!')  
        

    return render(request,'user/user-file-upload.html')

def user_file_download(request):
    print("ccccccccccccccccccccccccccccc")
    if request.method=="POST":
       print("gsgsgsgsgsg")
       demo =  request.POST.get('demo')
       print(demo)
       print("gsgsgsgsgs")
    user_id = request.session['user_id']
    print(user_id)
    file_details = fileUploadModel.objects.filter(user_id=user_id)
    user_rights = AccessControlModel.objects.get(user_id=user_id)
    download_right = user_rights.user_download
    update_right = user_rights.user_update
    print(download_right)
    print(update_right)
  
    # if request.method=="POST":
    #     search_text = request.POST.get('search')
    #     file_details = fileUploadModel.objects.filter(Q(file_name__icontains=search_text))
   
   
    return render(request,'user/user-file-download.html',{'data':file_details,'download':download_right,'update':update_right})

def user_upload_request(request,id):
    user_data = UserRegisterModel.objects.get(user_id = id)
    user_upload_request = AccessControlModel.objects.get(user_id=id)
    check = user_upload_request.user_upload
    print(check)
    user_name = user_data.user_name
    user_email = user_data.user_email
    user_request = "UPLOAD"
    if check == "YES":
         messages.error(request,'You are authorized to upload files!')
         return redirect('user-file-rights')
    else:
        UserRequestRightModel.objects.create(user_id=id,user_name=user_name,user_email=user_email,user_request=user_request)
    messages.info(request,'Your upload request has been sent Successfully. You will receive the update within 24 hours!')  
    return redirect('user-file-rights')

def user_download_request(request,id):
    user_data = UserRegisterModel.objects.get(user_id = id)
    user_download_request = AccessControlModel.objects.get(user_id=id)
    check = user_download_request.user_download
    print(user_data)
    print("request")
    print(id)
    print("request")
    user_name = user_data.user_name
    user_email = user_data.user_email
    user_request = "DOWNLOAD"
    if check == "YES":
        messages.error(request,'You are authorized to download files!')
        return redirect('user-file-rights')
    else:
        UserRequestRightModel.objects.create(user_id=id,user_name=user_name,user_email=user_email,user_request=user_request)
        messages.info(request,'Your download request has been sent Successfully. You will receive the update within 24 hours!') 
    return redirect('user-file-rights')

def user_update_request(request,id):
    user_data = UserRegisterModel.objects.get(user_id = id)
    user_update_request = AccessControlModel.objects.get(user_id=id)
    check = user_update_request.user_update
    print(user_data)
    print("request")
    print(id)
    print("request")
    user_name = user_data.user_name
    user_email = user_data.user_email
    user_request = "UPDATE"
    if check == "YES":
        messages.error(request,'You are authorized to update files!')
        return redirect('user-file-rights')
    else:
        UserRequestRightModel.objects.create(user_id=id,user_name=user_name,user_email=user_email,user_request=user_request)
        messages.info(request,'Your update request has been sent Successfully. You will receive the update within 24 hours!') 
    return redirect('user-file-rights')



