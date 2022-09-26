"""cloudmanagementproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import imp
from xml.dom.minidom import Document
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from mainapp import views as main_views
from userapp import views as user_views
from adminapp import views as admin_views
from cloudapp import views as cloud_views


urlpatterns = [
    path('admin/', admin.site.urls),

    # main app views
    path('',main_views.index,name='index'),

    #user app views
    path('user-register',user_views.user_register,name='user-register'),
    path('user-otp',user_views.otp,name='user-otp'),
    path('user-login',user_views.user_login,name='user-login'),
    path('user-token',user_views.user_token,name='user-token'),
    path('user-index',user_views.user_index,name='user-index'),
    path('user-profile',user_views.user_profile,name='user-profile'),
    path('user-file-rights',user_views.user_file_rights,name='user-file-rights'),
    path('user-file-upload',user_views.user_file_upload,name='user-file-upload'),
    path('user-file-download',user_views.user_file_download,name='user-file-download'),
    path('user-upload-request/<int:id>/',user_views.user_upload_request,name='user-upload-request'),
    path('user-download-request/<int:id>/',user_views.user_download_request,name='user-download-request'),
    path('user-update-request/<int:id>/',user_views.user_update_request,name='user-update-request'),
    path('user-file-edit/<int:id>/',user_views.user_file_edit,name='user-file-edit'),
    
    #admin app views
    path('admin-login',admin_views.admin_login,name='admin-login'),
    path('admin-index',admin_views.admin_index,name='admin-index'),
    path('admin-view-users',admin_views.admin_view_active_users,name='admin-view-users'),
    path('admin-view-files',admin_views.admin_view_files,name='admin-view-files'),

    #cloud app views
    path('cloud-login',cloud_views.cloud_login,name='cloud-login'),
    path('cloud-index',cloud_views.cloud_index,name='cloud-index'),
    path('cloud-access-control',cloud_views.cloud_access_control,name='cloud-access-control'),
    path('cloud-authorization',cloud_views.cloud_authorization,name='cloud-authorization'),
    path('cloud-activated-users',cloud_views.cloud_view_activated_users,name='cloud-activated-users'),
    path('cloud-user-request',cloud_views.cloud_view_user_request,name='cloud-user-request'),
    path('accept-user-request/<int:id>/',cloud_views.accept_user_request,name='accept-user-request'),
    path('reject-user-request/<int:id>/',cloud_views.reject_user_request,name='reject-user-request'),
    path('accept-user/<int:id>/',cloud_views.accept_user,name='accept-user'),
    path('reject-user/<int:id>/',cloud_views.reject_user,name='reject-user'),
    path('access_control/<int:id>/',cloud_views.access_control,name='cloud-permission'),

]



urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
