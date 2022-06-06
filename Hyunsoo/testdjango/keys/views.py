from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .models import Er, Th, ThGr
from django.db.models import Avg, Max, Min, Sum, Count
import random
from .serializers import Random_Recommand_Theme_serial
from django.shortcuts import render, get_object_or_404, redirect


@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def Random_Recommand_Theme(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = Random_Recommand_Theme_serial(randomThs, many=True)
    return Response(serializer.data)

def image(request, id):
    th = Th.objects.get(id=id)
    th=th
    context = {'th': th }
    return render(request, 'image.html', context)