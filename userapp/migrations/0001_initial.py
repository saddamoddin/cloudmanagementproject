# Generated by Django 4.0.4 on 2022-05-14 11:26

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AccessControlModel',
            fields=[
                ('access_control_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_id', models.IntegerField(null=True)),
                ('token_no', models.IntegerField(null=True)),
                ('user_name', models.CharField(help_text='Enter your name', max_length=50)),
                ('user_email', models.EmailField(help_text='Enter your email', max_length=60)),
                ('user_upload', models.CharField(max_length=120)),
                ('user_download', models.CharField(max_length=120)),
                ('user_update', models.CharField(max_length=120)),
                ('posted_date', models.DateField(auto_now=True)),
            ],
            options={
                'db_table': 'cloud_access_control',
            },
        ),
        migrations.CreateModel(
            name='fileUploadModel',
            fields=[
                ('file_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_id', models.IntegerField(null=True)),
                ('file', models.FileField(upload_to='user/files/')),
                ('file_name', models.CharField(help_text='file_name', max_length=200)),
                ('file_size', models.BigIntegerField(help_text='file_size', null=True)),
                ('file_type', models.CharField(help_text='file_type', max_length=300)),
                ('file_uploded_date', models.DateField(auto_now=True)),
            ],
            options={
                'db_table': 'file_details',
            },
        ),
        migrations.CreateModel(
            name='UserRegisterModel',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('user_name', models.CharField(help_text='Enter your name', max_length=50)),
                ('user_email', models.EmailField(help_text='Enter your email', max_length=60)),
                ('user_contact', models.BigIntegerField(help_text='Enter Your Contact Number')),
                ('user_state', models.CharField(help_text='Enter Your adhar num', max_length=120)),
                ('user_dob', models.DateField(help_text='Enter Your date of birth')),
                ('user_profile', models.ImageField(null=True, upload_to='user/images/')),
                ('user_password', models.CharField(help_text='Enter Your Password', max_length=200)),
                ('status', models.CharField(default='Pending', max_length=50)),
                ('otp', models.IntegerField(null=True)),
                ('token_no', models.IntegerField(null=True)),
                ('reg_date', models.DateField(auto_now=True)),
            ],
            options={
                'db_table': 'user_details',
            },
        ),
    ]
