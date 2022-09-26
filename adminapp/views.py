from django.shortcuts import redirect, render
from userapp.models import UserRegisterModel , fileUploadModel ,UserRequestRightModel
from django.db.models import Q


# Create your views here.

def admin_login(request):
    if request.method == "POST":
        name = request.POST.get('name')
        password = request.POST.get('password')
        if(name=='admin' and password == 'admin'):
            return redirect('admin-index')
        else:
            return redirect('admin-login')
    return render(request,'admin/admin-login.html')

def admin_index(request):
    users = UserRegisterModel.objects.filter(status ="Accepted").count()
    b = fileUploadModel.objects.count()
    a = UserRegisterModel.objects.filter(status ="Pending").count()
   
    
    return render(request,'admin/admin-index.html', {'users':users,'a':a,'b':b})

def admin_authorization(request):
    
    return render(request,'admin/admin-authorization.html')

def admin_view_active_users(request):
    data = UserRegisterModel.objects.filter(status="Accepted")
    if request.method=="POST":
        search_text = request.POST.get('search')
        data = UserRegisterModel.objects.filter(Q(user_name__icontains=search_text) | Q(user_email__icontains=search_text) | Q(user_contact__icontains=search_text) | Q(user_dob__icontains=search_text) | Q(user_state__icontains=search_text),status="Accepted")
    return render(request,'admin/admin-view-activated-users.html',{'data':data})

def admin_view_files(request):
    file_details = fileUploadModel.objects.all()
    data = UserRegisterModel.objects.all()
    return render(request,'admin/admin-view-user-files.html',{'files':file_details,'user_data':data})

