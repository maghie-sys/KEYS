from django.urls import path, include
from .views import helloAPI, home_recommand, show_theme_all,\
    show_theme, show_er_all, show_er, show_review_all, show_review, \
    show_img, show_img_all
from . import views

#from rest_framework_swagger

app_name='keys'

urlpatterns = [
    # -----------RESTAPI
    path("api/hello/", helloAPI),
    path("api/home/<int:id>/", home_recommand),

    path("api/escape/all", show_er_all),
    path("api/escape/<int:id>", show_er),

    path("api/theme/all", show_theme_all),
    path("api/theme/<int:id>", show_theme),

    path("api/theme/<int:id>/thrvw_all", show_review_all),
    path("api/theme/<int:id>/thrvw/<int:id2>", show_review),

    path("api/theme/<int:id>/thimg_all", show_img_all),
    path("api/theme/<int:id>/thimg/<int:id2>", show_img),

    #-----------HTML
    path("html/home/", views.home, name='home'),
    path("html/fc/", views.fc_index, name='fc_index'),

    path("html/er/" , views.er_index, name='er_index'),
    path("html/er/<int:er_id>/" , views.er_detail, name='er_detail'),
    path("html/er/create/" , views.er_create, name='er_create'),
    path("html/erimg/<int:er_id>", views.erimg_detail, name='erimg_detail'),
    path("html/er/modify/<int:er_id>", views.er_modify, name='er_modify'),
    path("html/er/delete/<int:er_id>", views.er_delete, name='er_delete'),

    path("html/th/", views.th_index, name='th_index'),
    path("html/th/<int:th_id>/", views.th_detail, name='th_detail'),
    path("html/thimg/<int:th_id>", views.thimg_detail, name='thimg_detail'),
    path("html/th/create/<int:er_id>/", views.theme_create, name='theme_create'),
    path("html/th/modify/<int:th_id>", views.th_modify, name='th_modify'),
    path("html/th/delete/<int:th_id>", views.th_delete, name='th_delete'),

    path("html/rvw/<int:th_id>", views.thgr_detail, name='thgr_detail'),
    path('html/review/create/<int:th_id>/', views.review_create, name='review_create'),
    path("html/rvw/modify/<int:thgr_id>", views.thgr_modify, name='thgr_modify'),
    path("html/rvw/delete/<int:thgr_id>", views.thgr_delete, name='thgr_delete'),
    #path('html/th/create/', views.theme_create, name='theme_create'),


]


