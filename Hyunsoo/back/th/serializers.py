from rest_framework import serializers
from .models import Er, ErAd, Th, ThGr, ThImg
from django.db.models import Avg, Max, Min, Sum, Count

#------------------------------------------------------------


class show_image_se(serializers.ModelSerializer):
    #Th_img=serializers.SerializerMethodField()
    class Meta:
        model = ThImg
        fields = (
            'Th_img'
        )

#------------------------------------------------------------
class show_theme_se(serializers.ModelSerializer):
    #ThGr = sh_th_gr_serializer(read_only=True)
    class Meta:
        model = Th
        fields = (
            'Th_Name',
            'Th_Genre',
            'Th_Diff',
            'Th_Fear',
            'Th_Act',
            'Th_Intro'
        )

# ------------------------------------------------------------
class show_review_se(serializers.ModelSerializer):
    class Meta:
        model = ThGr
        fields = (
            'ThGr_pt',
            'ThGr_review'
        )

#------------------------------------------------------------
class home_recommand_se(serializers.ModelSerializer):
    class Meta:
        model = Th
        fields = (
            'Th_Name',
            'Th_Genre'
        )

# ------------------------------------------------------------