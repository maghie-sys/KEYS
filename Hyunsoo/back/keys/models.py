import os
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
# Create your models here.
from django.contrib.auth.models import User

class Fc(models.Model):
    Fc_Name = models.CharField(max_length=20)
    Fc_Num = models.CharField(max_length=20, null=True)
    Fc_Brn = models.CharField(max_length=20, null=True) #Business Registration Number

class Er(models.Model):
    #Er_CODE = models.CharField(max_length=8)
    # Fc_CODE = models.CharField(max_length=8)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    Er_Name = models.CharField(max_length=20, null=True, blank=True)
    Er_Num = models.CharField(max_length=20, null=True, blank=True)
    # ErPic_CODE = models.CharField(max_length=8)
    #Er_Grpt = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    #Er_Review = models.TextField(max_length=200)
    ErAd_Num = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(99999)], null=True, blank=True) # 우편번호
    ErAd_Add1 = models.CharField(max_length=20, blank=True, null=True) # 도
    ErAd_Add2 = models.CharField(max_length=20, null=True, blank=True) # 시
    ErAd_Add3 = models.CharField(max_length=20, null=True, blank=True) # 구
    ErAd_Add4 = models.CharField(max_length=20, null=True, blank=True) # 동 또는 도로명
    ErAd_Add5 = models.CharField(max_length=20, null=True, blank=True) # 이후 주소
    create_date = models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)

class Th(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    er = models.ForeignKey(Er, on_delete=models.CASCADE)
    Th_Name = models.CharField(max_length=20, null=False)
    Th_Genre = models.CharField(max_length=20)
    Th_Diff = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)], null=True, blank=True)
    Th_Fear = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)], null=True, blank=True)
    Th_Act = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)], null=True, blank=True)
    Th_Intro = models.TextField(max_length=200, null=True, blank=True)
    create_date = models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)

class ThGr(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    th = models.ForeignKey(Th, on_delete=models.CASCADE,max_length=8)
    #Th_CODE = models.CharField(max_length=8)
    #ThGr_CODE = models.CharField(max_length=8)
    ThGr_pt = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)])
    ThGr_review = models.TextField(max_length=200, null=True, blank=True)
    create_date = models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)

class ErImg(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    er = models.ForeignKey(Er, on_delete=models.CASCADE)
    #Th_CODE = models.CharField(max_length=8)
    #ThGr_CODE = models.CharField(max_length=8)
    Er_img = models.ImageField(default='/image/noimage.png', upload_to='image/er/', blank=True, null=True)
    create_date=models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)

class ThImg(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    th = models.ForeignKey(Th, on_delete=models.CASCADE)
    #Th_CODE = models.CharField(max_length=8)
    #ThGr_CODE = models.CharField(max_length=8)
    Th_img = models.ImageField(default='/image/noimage.png', upload_to='image/th/', blank=True, null=True)
    create_date=models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)

class ThGrImg(models.Model):
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    thgr = models.ForeignKey(ThGr, on_delete=models.CASCADE)
    #Th_CODE = models.CharField(max_length=8)
    #ThGr_CODE = models.CharField(max_length=8)
    ThGr_img = models.ImageField(default='/image/noimage.png', upload_to='image/thgr/', blank=True, null=True)
    create_date=models.DateTimeField()
    modify_date = models.DateTimeField(null=True, blank=True)