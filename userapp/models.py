from distutils.command.upload import upload
from importlib import metadata
from django.db import models


# Create your models here.


class UserRegisterModel(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(help_text=("Enter your name"), max_length=50)
    user_email = models.EmailField(help_text=("Enter your email"),max_length=60)
    user_contact = models.BigIntegerField(help_text = "Enter Your Contact Number")
    user_state = models.CharField(help_text = "Enter Your adhar num",max_length=120)
    user_dob = models.DateField(help_text = "Enter Your date of birth")
    user_profile = models.ImageField(upload_to = 'images/', null=True)
    user_password = models.CharField(help_text = "Enter Your Password" , max_length=200)
    status = models.CharField(max_length=50,default="Pending")
    otp = models.IntegerField(null=True)
    token_no = models.IntegerField(null=True)
    reg_date = models.DateField(auto_now = True)
    class Meta:
        db_table = "user_details"


class fileUploadModel(models.Model):
    file_id=models.AutoField(primary_key=True)
    user_id=models.IntegerField(null=True)
    user_name = models.CharField(max_length=120,null=True)
    file=models.FileField(upload_to='files/',)
    file_name=models.CharField(help_text='file_name',max_length=200)
    file_size=models.BigIntegerField(help_text='file_size',null=True)
    file_type=models.CharField(help_text='file_type',max_length=300)
    file_uploded_date=models.DateField(auto_now=True)

    class Meta:
        db_table='file_details'

class AccessControlModel(models.Model):
    access_control_id = models.AutoField(primary_key=True)
    user_id = models.IntegerField(null=True)
    user_name = models.CharField(help_text=("Enter your name"), max_length=50)
    user_email = models.EmailField(help_text=("Enter your email"),max_length=60)
    user_upload = models.CharField(max_length=120)
    user_download = models.CharField(max_length=120)
    user_update = models.CharField(max_length=120)
    posted_date = models.DateField(auto_now = True)
    class Meta:
        db_table = "cloud_access_control"

class UserRequestRightModel(models.Model):
    rights_request_id = models.AutoField(primary_key=True)
    user_id = models.IntegerField(null=True)
    user_name = models.CharField(help_text=("Enter your name"), max_length=50)
    user_email = models.EmailField(help_text=("Enter your email"),max_length=60,null=True)
    user_request = models.CharField(max_length=120)
    status = models.CharField(max_length=50,default="Pending")
    posted_date = models.DateField(auto_now = True)
    class Meta:
        db_table = "user_request_rights"


