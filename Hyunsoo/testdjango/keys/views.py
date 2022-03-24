from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .models import Er, Th, ThGr
from django.db.models import Avg, Max, Min, Sum, Count
import random
from .serializers import Random_Recommand_Theme_serial

@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def Random_Recommand_Theme(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = Random_Recommand_Theme_serial(randomThs, many=True)
    return Response(serializer.data)