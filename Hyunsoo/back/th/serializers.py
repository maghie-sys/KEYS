from rest_framework import serializers
from .models import Er, ErAd, Th, ThGr, ThImg, All
from django.db.models import Avg, Max, Min, Sum, Count

#------------------------------------------------------------


class show_image_se(serializers.ModelSerializer):
    #Th_img=serializers.SerializerMethodField()
    class Meta:
        model = ThImg
        fields = (
            'Th_CODE',
            'ThGr_CODE',
            'Th_img'
        )

#------------------------------------------------------------
class show_theme_se(serializers.ModelSerializer):
    #ThGr = sh_th_gr_serializer(read_only=True)
    class Meta:
        model = Th
        fields = (
            'Th_CODE',
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
            'Th_CODE',
            'ThGr_CODE',
            'ThGr_pt',
            'ThGr_review'
        )

#------------------------------------------------------------
class home_recommand_se(serializers.ModelSerializer):
    class Meta:
        model = Th
        fields = (
            'Th_CODE',
            'Th_Name',
            'Th_Genre'
        )

# ------------------------------------------------------------
class all_theme_se(serializers.ModelSerializer):
    th = show_theme_se(read_only=True)
    thgr = show_review_se(read_only=True)
    thimg = show_image_se(read_only=True)
    #thimg = serializers.SerializerMethodField(read_only=True)
    class Meta:
        model = All
        fields = (
            'th',
            'thgr',
            'thimg'
        )
