from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Er, ErAd, Th, ThGr, ThImg, All
from django.db.models import Avg, Max, Min, Sum, Count
from .serializers import home_recommand_se, show_review_se, show_theme_se, show_image_se, all_theme_se
from itertools import chain
import random

@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def home_recommand(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = home_recommand_se(randomThs, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def show_theme(request, id):
    Ths = Th.objects.filter(Th_CODE=id)
    serializer = show_theme_se(Ths, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def show_review(request,id,re_id):
    #thgrs = ThGr.objects.filter(Th_CODE=id)
    thgrd = ThGr.objects.filter(ThGr_CODE=re_id)
    serializer = show_review_se(thgrd, many=True)
    return  Response(serializer.data)

@api_view(['GET'])
def show_image(request,id, re_id):
    img = ThImg.objects.filter(ThGr_CODE=re_id)
    serializer = show_image_se(img, many=True)
    return  Response(serializer.data)

@api_view(['GET'])
def all_theme(request, id):
    all = All.objects.filter(Th_CODE = id)
    serializer = all_theme_se(all, many=True)
    return Response(serializer.data)