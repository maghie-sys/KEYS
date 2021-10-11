from rest_framework import serializers
from .models import Er, ErAd, Th, ThGr, ThImg, All
from django.db.models import Avg, Max, Min, Sum, Count

#------------------------------------------------------------
'''
class show_image_se(serializers.ModelSerializer):
    Th_pic = serializers.ImageField(use_url=True)
    class Meta:
        model = ThImg
        fields = ('Th_pic')
'''

class show_image_se(serializers.ModelSerializer):
    Th_img = serializers.ImageField(use_url=True)
    a = serializers.SerializerMethodField()
    class Meta:
        model = ThImg
        fields = (
            'Th_CODE',
            'Th_img',
            'a'
        )

    def get_a(self, obj):
        return ThImg.objects.aggregate(Count('Th_img'))

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
            #'Th_Pic1'
        )

# ------------------------------------------------------------
class all_theme_se(serializers.ModelSerializer):
    th = show_theme_se(read_only=True)
    thgr = show_review_se(read_only=True)
    thimg = show_image_se(read_only=True)
    class Meta:
        model = All
        fields = (
            'th',
            'thgr',
            'thimg'
        )

'''     
#------------------------------------------------------------
class av_sh_th_gr_serializer(serializers.ModelSerializer):
    CODE = serializers.SerializerMethodField()
    ThGr_avpt = serializers.SerializerMethodField()
    ThGr_pt = serializers.SerializerMethodField()
    ThGr_review = serializers.SerializerMethodField()
    class Meta:
        model = ThGr
        fields = (
            'CODE',
            'ThGr_avpt',
            'ThGr_pt',
            'ThGr_review'
        )
    def get_CODE(self, obj):
        CODE = ThGr.objects.aggregate(ThGr_pt=Max('ThGr_pt')).get('CODE')
        return CODE

    def get_ThGr_avpt(self, obj):
        return ThGr.objects.aggregate(Avg('ThGr_pt'))

    def get_ThGr_pt(self, obj, CODE):
        #filter = ThGr.objects.filter(ThGr_CODE=obj)
        return ThGr.objects.filter(CODE=CODE).get('ThGr_pt')

    def get_ThGr_review(self, obj):
        return ThGr.objects.values('ThGr_review')
'''