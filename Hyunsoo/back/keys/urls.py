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

    path("api/theme/<int:id>/review_all", show_review_all),
    path("api/theme/<int:id>/review/<int:id2>", show_review),

    path("api/theme/<int:id>/img_all", show_img_all),
    path("api/theme/<int:id>/img/<int:id2>", show_img),

    #-----------HTML
    path("html/home/", views.home, name='home'),
    path("html/fc/", views.fc_index, name='fc_index'),

    path("html/er/" , views.er_index, name='er_index'),
    path("html/er/<int:er_id>/" , views.er_detail, name='er_detail'),
    path("html/er/create/" , views.er_create, name='er_create'),
    path("html/er/create/<int:er_id>/", views.th_create2, name='th_create2'),

    path("html/th/", views.th_index, name='th_index'),
    path("html/th/<int:th_id>/", views.th_detail, name='th_detail'),

    path('html/review/create/<int:th_id>/', views.review_create, name='review_create'),
    path('html/th/create/', views.theme_create, name='theme_create'),


]
