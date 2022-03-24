import os
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
# Create your models here.

class Er(models.Model):
    Er_Brand = models.CharField(max_length=20)
    Er_Name = models.CharField(max_length=20, null=True, blank=True)
    Er_Num = models.CharField(max_length=20, null=True, blank=True)
    ErAd_Add = models.CharField(max_length=50, blank=True, null=True)
    Er_Homepage = models.CharField(max_length=100, blank=True, null=True)

class Th(models.Model):
    er = models.ForeignKey(Er, on_delete=models.CASCADE)
    Th_Name = models.CharField(max_length=20, null=True, blank=True)
    Th_Genre = models.CharField(max_length=20, null=True, blank=True)
    Th_Nop = models.CharField(max_length=10, null=True, blank=True)
    Th_Time = models.CharField(max_length=5, null=True, blank=True)
    Th_Diff = models.CharField(max_length=10, null=True, blank=True)
    Th_Fear = models.CharField(max_length=10, null=True, blank=True)
    Th_Act = models.CharField(max_length=10, null=True, blank=True)
    Th_Price1 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price2 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price3 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price4 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price5 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price6 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price7 = models.CharField(max_length=10, null=True, blank=True)
    Th_Price8 = models.CharField(max_length=10, null=True, blank=True)
    Th_Reservation = models.CharField(max_length=100, null=True, blank=True)
    Th_Intro = models.TextField(max_length=1000, null=True, blank=True)
    Th_Img1 = models.ImageField(default='/image/noimage.png', upload_to='image/th/', blank=True, null=True)
    Th_Img2 = models.ImageField(default='/image/noimage.png', upload_to='image/th/', blank=True, null=True)

class ThGr(models.Model):
    th = models.ForeignKey(Th, on_delete=models.CASCADE,max_length=8)
    ThGr_Pt = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(5)])
    ThGr_Review = models.TextField(max_length=200, null=True, blank=True)