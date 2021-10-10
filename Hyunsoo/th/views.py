from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Er, ErAd, Th, ThGr, ThPic
from .serializers import home_recom_serializer, sh_th_serializer, sh_th_gr_serializer, av_sh_th_gr_serializer
from itertools import chain
import random

@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def home_recom_random(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = home_recom_serializer(randomThs, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def sh_th(request, id):
    Ths = Th.objects.filter(Th_CODE=id)
    serializer = sh_th_serializer(Ths, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def sh_th_gr(request,id):
    thgrs = ThGr.objects.filter(ThGr_CODE=id)
    serializer = sh_th_gr_serializer(thgrs, many=True)
    return  Response(serializer.data)
