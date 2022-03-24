from rest_framework import serializers
from .models import Er, Th, ThGr


class Random_Recommand_Theme_serial(serializers.ModelSerializer):
    class Meta:
        model = Th
        fields = [
            'id',
            'Th_Img1',
        ]