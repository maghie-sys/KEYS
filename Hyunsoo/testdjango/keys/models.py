import os
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
# Create your models here.
from django.contrib.auth.models import User

class Er(models.Model):
    Er_Brand = models.CharField(max_length=20)
    author = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    Er_Name = models.CharField(max_length=20, null=True, blank=True)
    Er_Num = models.CharField(max_length=20, null=True, blank=True)
    Er_Add = models.CharField(max_length=100, blank=True, null=True)
    Er_Reservation = models.CharField(max_length=500, null=True, blank=True)
    create_date = models.DateTimeField(null=True)
    modify_date = models.DateTimeField(null=True, blank=True)

class Th(models.Model):
    er = models.ForeignKey(Er, on_delete=models.CASCADE)
    author = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    Th_Name = models.CharField(max_length=20, null=True, blank=True)
    Th_Genre = models.CharField(max_length=20, null=True, blank=True)
    Th_Nop = models.CharField(max_length=10, null=True, blank=True)
    Th_Time = models.CharField(max_length=10, null=True, blank=True)
    Th_Diff = models.CharField(max_length=10, null=True, blank=True)
    Th_Intro = models.TextField(max_length=5000, null=True, blank=True)
    Th_Img1 = models.ImageField(default='/image/noimage.png', upload_to='image/th/', blank=True, null=True)
    create_date = models.DateTimeField(null=True)
    modify_date = models.DateTimeField(null=True, blank=True)