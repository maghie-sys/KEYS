from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .models import Er, Th
from django.db.models import Avg, Max, Min, Sum, Count
import random
from .serializers import Random_Recommand_Theme_serial, Th_Detail_serial
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from .forms import ThemeForm, ErForm
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.db.models import Q

@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def Random_Recommand_Theme(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = Random_Recommand_Theme_serial(randomThs, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def show_Theme(request, id):
    Ths = Th.objects.filter(id=id)
    serializer = Th_Detail_serial(Ths, many=True)
    return Response(serializer.data)

def image(request, id):
    th = Th.objects.get(id=id)
    th=th
    context = {'th': th }
    return render(request, 'image.html', context)


# HTML용 view-----------------------------------------
def home(request):
    return render(request, 'home/home.html')

# 매장 -------------------------------------
def er_index(request):
    page = request.GET.get('page', '1')  # 페이지
    kw = request.GET.get('kw', '')  # 검색어
    er_list = Er.objects.order_by('id')
    if kw:
        er_list = er_list.filter(
            Q(Er_Name__icontains=kw) |  # 매장명 검색
            Q(Er_Add__icontains=kw) |  # 매장 주소 검색
            Q(Er_Brand__icontains=kw) |  # 매장 브랜드 검색
            Q(Er_Num__icontains=kw)  |  # 매장 전화번호 검색
            Q(author__username__icontains=kw)  # 질문 글쓴이 검색
        ).distinct()
    paginator = Paginator(er_list, 1000)  # 페이지당 10개씩 보여주기
    page_obj = paginator.get_page(page)
    context = {'er_list': page_obj, 'page' : page, 'kw': kw}
    return render(request, 'er/er_list.html', context)

def er_detail(request, er_id):
    """테마 내용 출력"""
    er = Er.objects.get(id=er_id)
    context = {'er': er }
    return render(request, 'er/er_detail.html', context)
    #return HttpResponse("asdfasdf")

@login_required(login_url='user:login')
def er_create(request):
    """테마등록"""
    if request.method=='POST':
        form = ErForm(request.POST)
        if form.is_valid():
            er = form.save(commit=False)
            er.author = request.user
            er.create_date = timezone.now()
            er.save()
            return redirect('keys:er_index')
    else:
        form = ErForm()
    context = {'form': form }
    return render(request, 'er/er_form.html' , {'form':form } )

@login_required(login_url='user:login')
def er_modify(request, er_id):
    er = Er.objects.get(id=er_id)
    if request.user != er.author:
        messages.error(request, '수정권한이 없습니다')
        return redirect('keys:er_detail', er_id=er.id)

    if request.method == "POST":
        form = ErForm(request.POST, instance=er)
        if form.is_valid():
            er = form.save(commit=False)
            er.modify_date = timezone.now()  # 수정일시 저장
            er.save()
            return redirect('keys:er_detail', er_id=er.id)
    else:
        form = ErForm(instance=er)
    context = {'form': form}
    return render(request, 'er/er_form.html', context)

@login_required(login_url='user:login')
def er_delete(request, er_id):
    er=Er.objects.get(id=er_id)
    if request.user != er.author:
        messages.error(request, '삭제권한이 없습니다')
        return redirect('keys:er_detail', er_id=er.id)
    er.delete()
    return redirect('keys:er_index')

# 테마 -------------------------------------

def th_index(request):
    page = request.GET.get('page', '1')
    kw = request.GET.get('kw', '')  # 검색어
    th_list = Th.objects.order_by('id')
    if kw:
        th_list = th_list.filter(
            Q(Th_Name__icontains=kw) |  # 테마이름 검색
            Q(Th_Genre__icontains=kw) |  # 장르 검색
            Q(Th_Nop__icontains=kw) |  # 인원 검색
            Q(Th_Time__icontains=kw)  |  # 시간 검색
            Q(Th_Diff__icontains=kw) |  # 난이도 검색
            Q(author__username__icontains=kw)  # 질문 글쓴이 검색
        ).distinct()
    paginator = Paginator(th_list, 1000)  # 페이지당 10개씩 보여주기
    page_obj = paginator.get_page(page)
    context = {'th_list': page_obj, 'page': page, 'kw': kw}
    return render(request, 'th/th_list.html', context)

def th_detail(request, th_id):
    """테마 내용 출력"""
    th = Th.objects.get(id=th_id)
    er= th.er
    #th = get_object_or_404(Th, pk=th_name)
    context = {'th': th, 'er' : er }
    return render(request, 'th/th_detail.html', context)

@login_required(login_url='user:login')
def theme_create(request, er_id):
    """테마등록"""
    er = Er.objects.get(id=er_id)
    if request.method=='POST':
        form = ThemeForm(request.POST, request.FILES)
        if form.is_valid():
            th = form.save(commit=False)
            #th.Th_Img1= request.FILES['Th_Img1']
            th.author = request.user
            th.create_date = timezone.now()
            th.er = er
            th.save()
            return redirect('keys:er_detail', er_id=er.id)
    else:
        form = ThemeForm()
    context = {'er': er, 'form': form}
    return render(request, 'th/th_form.html', context)

@login_required(login_url='user:login')
def th_modify(request, th_id):
    th = Th.objects.get(id=th_id)
    er=th.er
    if request.user != th.author:
        messages.error(request, '수정권한이 없습니다')
        return redirect('keys:th_detail', th_id=th.id)

    if request.method == "POST":
        form = ThemeForm(request.POST, request.FILES, instance=th)
        if form.is_valid():
            th = form.save(commit=False)
            #Th_Img1= request.FILES["Th_Img1"]
            th.modify_date = timezone.now()  # 수정일시 저장
            th.save()
            return redirect('keys:th_detail', th_id=th.id)
    else:
        form = ThemeForm(instance=th)
    context = {'form': form}
    return render(request, 'th/th_form.html', context)

@login_required(login_url='user:login')
def th_delete(request, th_id):
    th=Th.objects.get(id=th_id)
    er=th.er
    if request.user != th.author:
        messages.error(request, '삭제권한이 없습니다')
        return redirect('keys:th_detail', th_id=th.id)
    th.delete()
    return redirect('keys:er_detail', er_id=er.id)