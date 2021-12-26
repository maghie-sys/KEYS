from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.decorators import api_view
from .models import Er, Th, ThGr, ThImg, Fc, ErImg, ThGrImg
from django.db.models import Avg, Max, Min, Sum, Count
from .serializers import home_recommand_se, show_review_se, show_theme_se, show_image_se, show_er_se
from itertools import chain
from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from .forms import ThemeForm, ErForm, ThGrForm
from django.core.paginator import Paginator
import random
from django.contrib.auth.decorators import login_required
from django.contrib import messages


@api_view(['GET'])
def helloAPI(request):
    return Response("helloworld")

@api_view(['GET'])
def home_recommand(request, id):
    totalThs = Th.objects.all()
    randomThs = random.sample(list(totalThs), id)
    serializer = home_recommand_se(randomThs, many=True)
    return Response(serializer.data)

#---------------매장
@api_view(['GET'])
def show_er_all(request):
    query = Er.objects.all()
    serializer = show_er_se(query,many=True)
    return Response(serializer.data)

@api_view(['GET'])
def show_er(request, id):
    query = Er.objects.filter(id=id)
    serializer = show_er_se(query,many=True)
    return Response(serializer.data)

#---------------테마
@api_view(['GET'])
def show_theme_all(request):
    query = Th.objects.all()
    serializer = show_theme_se(query,many=True)
    return Response(serializer.data)

@api_view(['GET'])
def show_theme(request, id):
    query = Th.objects.filter(id=id)
    serializer = show_theme_se(query,many=True)
    return Response(serializer.data)

#---------------리뷰
@api_view(['GET'])
def show_review_all(request, id):
    #thgrs = ThGr.objects.filter(Th_CODE=id)
    th = Th.objects.get(id=id)
    query = ThGr.objects.filter(th=th.id)
    serializer = show_review_se(query, many=True)
    return  Response(serializer.data)

@api_view(['GET'])
def show_review(request, id, id2):
    th = Th.objects.get(id=id)
    thgr = ThGr.objects.get(id=id2)
    query = ThGr.objects.filter(th=th.id).filter(id=thgr.id)
    serializer = show_review_se(query, many=True)
    return  Response(serializer.data)

@api_view(['GET'])
def show_img_all(request, id):
    #thgrs = ThGr.objects.filter(Th_CODE=id)
    th = Th.objects.get(id=id)
    query = ThImg.objects.filter(th=th.id)
    serializer = show_image_se(query, many=True)
    return  Response(serializer.data)

@api_view(['GET'])
def show_img(request, id, id2):
    th = Th.objects.get(id=id)
    thimg = ThImg.objects.get(id=id2)
    query = ThImg.objects.filter(th=th.id).filter(id=thimg.id)
    serializer = show_image_se(query, many=True)
    return  Response(serializer.data)

# HTML용 view-----------------------------------------
def home(request):
    return render(request, 'home/home.html')

# 프랜차이즈 -------------------------------------
def fc_index(request):
    """francise view"""
    fc_list = Fc.objects.all
    context = {'fc_list': fc_list}
    return HttpResponse("fc_list")

def er_index(request):
   # page = request.GET.get('page', '1')
    er_list = Er.objects.all
    #paginator = Paginator(er_list, 10)  # 페이지당 10개씩 보여주기
    #page_obj = paginator.get_page(page)
    context = {'er_list': er_list}
    #context = {'er_list': er_list}
    return render(request, 'er/er_list.html', context)

def er_detail(request, er_id):
    """테마 내용 출력"""
    er = Er.objects.get(id=er_id)
    erimg = ErImg.objects.filter(er=er.id)
    context = {'er': er , 'erimg': erimg}
    return render(request, 'er/er_detail.html', context)
    #return HttpResponse("asdfasdf")

# 매장 -------------------------------------
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

def th_index(request):
    #page = request.GET.get('page', '1')
    th_list = Th.objects.all
    #paginator = Paginator(th_list, 10)  # 페이지당 10개씩 보여주기
    #page_obj = paginator.get_page(page)
    context = {'th_list': th_list }
    return render(request, 'th/th_list.html', context)

def th_detail(request, th_id):
    """테마 내용 출력"""
    th = Th.objects.get(id=th_id)
    er= th.er
    #th = get_object_or_404(Th, pk=th_name)
    context = {'th': th , 'er': er}
    return render(request, 'th/th_detail.html', context)

@login_required(login_url='user:login')
def theme_create(request, er_id):
    """테마등록"""
    er = Er.objects.get(id=er_id)
    if request.method=='POST':
        form = ThemeForm(request.POST)
        if form.is_valid():
            th = form.save(commit=False)
            th.author = request.user
            th.create_date = timezone.now()
            th.er = er
            th.save()
            return redirect('keys:er_detail', er_id=er.id)
    else:
        form = ThemeForm()
    context = {'er': er, 'form': form}
    return render(request, 'th/th_form.html', context)

def thgr_detail(request, th_id):
    """테마 내용 출력"""
    #th = Th.objects.get(id=th_id)
    th = Th.objects.get(id=th_id)
    avg = ThGr.objects.filter(th=th_id).aggregate(평균평점=Avg('ThGr_pt'))
    context = {'th': th , 'avg': avg }
    return render(request, 'thgr/thgr_detail.html', context)

@login_required(login_url='user:login')
def review_create(request, th_id):
    th = Th.objects.get(id=th_id)
    if request.method == "POST":
        form = ThGrForm(request.POST)
        if form.is_valid():
            thgr = form.save(commit=False)
            thgr.author = request.user
            thgr.create_date = timezone.now()
            thgr.th = th
            thgr.save()
            return redirect('keys:thgr_detail', th_id=th.id)
    else:
        form = ThGrForm()
    context = {'th': th, 'form': form}
    return render(request, 'thgr/thgr_form.html', context)

@login_required(login_url='user:login')
def erimg_detail(request, er_id):
    er = Er.objects.get(id=er_id)
    erimg= ErImg.objects.filter(er=er.id)
    context = {'er': er}
    return render(request, 'er/er_img.html', context)

@login_required(login_url='user:login')
def thimg_detail(request, th_id):
    th = Th.objects.get(id=th_id)
    er = th.er
    thimg= ThImg.objects.filter(th=th.id)
    context = {'th': th, 'er': er}
    return render(request, 'th/th_img.html', context)

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

@login_required(login_url='user:login')
def th_modify(request, th_id):
    th = Th.objects.get(id=th_id)
    er=th.er
    if request.user != th.author:
        messages.error(request, '수정권한이 없습니다')
        return redirect('keys:th_detail', th_id=th.id)

    if request.method == "POST":
        form = ThemeForm(request.POST, instance=th)
        if form.is_valid():
            th = form.save(commit=False)
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

@login_required(login_url='user:login')
def thgr_modify(request, thgr_id):
    thgr = ThGr.objects.get(id=thgr_id)
    th=thgr.th
    if request.user != thgr.author:
        messages.error(request, '수정권한이 없습니다')
        return redirect('keys:thgr_detail', th_id=th.id)

    if request.method == "POST":
        form = ThGrForm(request.POST, instance=thgr)
        if form.is_valid():
            thgr = form.save(commit=False)
            thgr.modify_date = timezone.now()  # 수정일시 저장
            thgr.save()
            return redirect('keys:thgr_detail', th_id=th.id)
    else:
        form = ThGrForm(instance=th)
    context = {'form': form}
    return render(request, 'thgr/thgr_form.html', context)

@login_required(login_url='user:login')
def thgr_delete(request, thgr_id):
    thgr=ThGr.objects.get(id=thgr_id)
    th=thgr.th
    if request.user != thgr.author:
        messages.error(request, '삭제권한이 없습니다')
        return redirect('keys:thgr_detail', th_id=th.id)
    thgr.delete()
    return redirect('keys:thgr_detail', th_id=th.id)