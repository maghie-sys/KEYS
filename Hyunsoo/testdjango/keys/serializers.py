from rest_framework import serializers
from .models import Er, Th
class Random_Recommand_Theme_serial(serializers.ModelSerializer):
    class Meta:
        model = Th
        fields = [
            'id',
            'Th_Img1',
        ]
class Er_Detail_serial(serializers.ModelSerializer):
    class Meta:
        model = Er
        fields = [
            'Er_Brand',
            'Er_Name',
            'Er_Num',
            'Er_Add',
            'Er_Reservation',
        ]
#------------------------------------------------------------
class Th_Detail_serial(serializers.ModelSerializer):
    er = Er_Detail_serial(serializers.ModelSerializer)
    class Meta:
        model = Th
        fields = [
            'id',
            'er',
            'Th_Name',
            'Th_Genre',
            'Th_Nop',
            'Th_Time',
            'Th_Diff',
            'Th_Intro',
            'Th_Img1',
        ]
#-------------------------------------------------------------

class search_serial(serializers.ModelSerializer):
    er = Er_Detail_serial(serializers.ModelSerializer)
    class Meta:
        model=Th
        fields = [
            'id',
            'er',
            'Th_Img1',
            ]