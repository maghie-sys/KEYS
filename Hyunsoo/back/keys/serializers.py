from rest_framework import serializers
from .models import Er, ErAd, Th, ThGr, ThImg
from django.db.models import Avg, Max, Min, Sum, Count
#------------------------------------------------------------
class show_er_se(serializers.ModelSerializer):
    class Meta:
        model = Er
        fields = (
            'id',
            'Er_Name',
            'Er_Num'
        )

#------------------------------------------------------------
class show_theme_se(serializers.ModelSerializer):
    #er = show_erid_se(serializers.ModelSerializer)
    class Meta:
        model = Th
        fields = (
            #'er',
            'id',
            'Th_Name',
            'Th_Genre',
            'Th_Diff',
            'Th_Fear',
            'Th_Act',
            'Th_Intro'
        )

class show_thid_se(serializers.ModelSerializer):
    class Meta:
        model = Th
        fields = (
            'id',
            #'Th_Name'
        )

# ------------------------------------------------------------
class show_review_se(serializers.ModelSerializer):
    th = show_thid_se(serializers.ModelSerializer)
    class Meta:
        model = ThGr
        fields = (
            'th',
            'id',
            'ThGr_pt',
            'ThGr_review',
            'create_date'
        )

#------------------------------------------------------------
class show_image_se(serializers.ModelSerializer):
    th = show_thid_se(serializers.ModelSerializer)
    class Meta:
        model = ThImg
        fields = (
            'th',
            'id',
            'Th_img',
            'create_date'
        )

#------------------------------------------------------------
class home_recommand_se(serializers.ModelSerializer):
    #img = show_image_se(serializers.ModelSerializer)
    class Meta:
        model = Th
        fields = (
            'id',
            'Th_Name',
            'Th_Genre',
            #'img'
        )

