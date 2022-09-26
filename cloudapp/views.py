from re import A
from django.shortcuts import get_object_or_404, render,redirect
from userapp.models import AccessControlModel, UserRequestRightModel
from userapp.models import UserRegisterModel , fileUploadModel
import random
from cloudmanagementproject.settings import DEFAULT_FROM_EMAIL
from django.core.mail import EmailMultiAlternatives
from django.db.models import Q
# Create your views here.

def cloud_login(request):
    if request.method == "POST":
        name = request.POST.get('name')
        password = request.POST.get('password')
        if(name=='cloud' and password == 'cloud'):
            return redirect('cloud-index')
        else:
            return redirect('cloud-login')
    return render(request,'cloud/cloud-login.html')

def cloud_index(request):
    users = UserRegisterModel.objects.filter(status ="Accepted").count()
    a = UserRequestRightModel.objects.filter(status ="Pending").count()
    b = UserRegisterModel.objects.filter(status = "Pending").count()
    c = fileUploadModel.objects.count()
   
    
    
    return render (request,'cloud/cloud-index.html',{'users':users,"a":a,'b':b,'c':c})

def cloud_access_control(request):
  
    print("rrrrrrrrrrrrrrrr")
   
    data = UserRegisterModel.objects.filter(status="Accepted",user_id=request.session['user_id'])
    print("sdfdsfsdfsd")
    # UserRegisterModel.objects.filter(user_id=user_id).update(status='verified')
    print(data)
    if request.method == "POST":
        print("post method ssssssssssssssssssss rrrrrrrrrrr")
        user_id = request.POST.get('user_id')
        token_no = request.POST.get('token_no')
        name = request.POST.get('name')
        email = request.POST.get('email')
        print(email)
        upload = request.POST.get('upload')
        update = request.POST.get('update')
        download = request.POST.get('download')
        html_content = "<br/><p>Token Number:<strong></strong> Your Token No is <strong>"  + str(token_no) + "</strong></p> <p>Upload <strong>"  + str(upload) + "</strong></p> <p>Update <strong>"  + str(update) + "</strong></p><p>download <strong>"  + str(download) + "</strong></p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [email]
        msg = EmailMultiAlternatives("Token Number", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
        AccessControlModel.objects.create(user_id=user_id,user_name=name,user_email=email,user_upload=upload,user_download=download,user_update=update)
    return render (request,'cloud/cloud-access-control.html',{'data':data})

def cloud_authorization(request):
    data = UserRegisterModel.objects.all()
    if request.method=="POST":
        search_text = request.POST.get('search')
        data = UserRegisterModel.objects.filter(Q(user_name__icontains=search_text) | Q(user_email__icontains=search_text) | Q(user_contact__icontains=search_text) | Q(user_dob__icontains=search_text) | Q(user_state__icontains=search_text))

   
    return render (request,'cloud/cloud-user-authorization.html',{'data':data})

def cloud_view_activated_users(request):
    data = UserRegisterModel.objects.filter(status="Accepted")
    if request.method=="POST":
        search_text = request.POST.get('search')
        data = UserRegisterModel.objects.filter(Q(user_name__icontains=search_text) | Q(user_email__icontains=search_text) | Q(user_contact__icontains=search_text) | Q(user_dob__icontains=search_text) | Q(user_state__icontains=search_text),status="Accepted")
    return render (request,'cloud/cloud-view-activated-users.html',{'data':data})

def cloud_view_user_request(request):
    data = UserRequestRightModel.objects.all()
    if request.method=="POST":
        search_text = request.POST.get('search')
        data = UserRequestRightModel.objects.filter(Q(user_name__icontains=search_text) | Q(user_email__icontains=search_text) | Q(user_request__icontains=search_text)| Q(request_id__icontains=search_text))
    return render (request,'cloud/cloud-view-user-request.html',{'data':data})

def accept_user_request(request,id):
    user_request_data = UserRequestRightModel.objects.get(rights_request_id = id)
    object = get_object_or_404(UserRequestRightModel,rights_request_id = id)
    email = object.user_email
    object.status = "Accepted"
    object.save(update_fields=['status'])
    object.save()
    user_request = user_request_data.user_request
    user_id = user_request_data.user_id
    obj = get_object_or_404(AccessControlModel,user_id = user_id)
    print("sssss")
    print(user_request)
    print(user_id)
    print("sssss")
    if user_request == "UPLOAD":
        obj.user_upload = "YES"
        obj.save(update_fields=['user_upload'])
        obj.save()
        html_content = "<br/><p>Request Accepted:<strong> Accepted </strong>Now you are able to upload files<strong></strong></p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [email]
        msg = EmailMultiAlternatives("Request Accepted", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
    if user_request == "DOWNLOAD":
        obj.user_download = "YES"
        obj.save(update_fields=['user_download'])
        obj.save()
        html_content = "<br/><p>Request Accepted:<strong> Accepted </strong>Now you are able to download files<strong></strong></p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [email]
        msg = EmailMultiAlternatives("Request Accepted", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
    if user_request == "UPDATE":
        obj.user_update = "YES"
        obj.save(update_fields=['user_update'])
        obj.save()
        html_content = "<br/><p>Request Accepted:<strong> Accepted </strong>Now you are able to update files<strong></strong></p>"
        from_mail = DEFAULT_FROM_EMAIL
        to_mail = [email]
        msg = EmailMultiAlternatives("Request Accepted", html_content, from_mail, to_mail)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
    return redirect('cloud-user-request')
def reject_user_request(request,id):
    object = get_object_or_404(UserRequestRightModel,rights_request_id = id)
    object.status = "Rejected"
    object.save(update_fields=['status'])
    object.save()
    return redirect('cloud-user-request')

def accept_user(request,id):
    request.session["user"] = id
    data = UserRegisterModel.objects.filter(user_id = id)
    print(data)
    token_no = random.randint(11111111,99999999)
    data = get_object_or_404(UserRegisterModel,user_id = id)
    data.token_no = token_no
    data.status = "Accepted"
    data.save(update_fields=['status','token_no'])
    data.save()
    return redirect('cloud-authorization')

def reject_user(request,id):
    data = UserRegisterModel.objects.filter(user_id = id)
    data = get_object_or_404(UserRegisterModel,user_id = id)
    data.status = "Rejected"
    data.save(update_fields=['status'])
    data.save()
    return redirect('cloud-authorization')

def access_control(request,id):
    request.session["user_id"] = id
    return redirect('cloud-access-control')


