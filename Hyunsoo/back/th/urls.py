from django.urls import path, include
from .views import helloAPI, home_recommand, show_review, show_theme, show_image
from . import views
#from rest_framework_swagger

app_name='th'

urlpatterns = [
    path("hello/", helloAPI),
    path("home/<int:id>/", home_recommand),
    path("theme/img/<int:re_id>", show_image),
    path("theme/review/<int:re_id>", show_review),
    path("theme/<int:id>/", show_theme),

    #-----------HTML
    path("html/home/", views.home, name='home'),
    path("html/fc/", views.fc_list, name='fc_list'),

    path("html/er/" , views.er_index, name='er_index'),
    path("html/er/<int:er_id>/" , views.er_detail, name='er_detail'),
    path("html/er/create/" , views.er_create, name='er_create'),
    path("html/er/create/<int:er_id>/", views.th_create2, name='th_create2'),

    path("html/theme/", views.th_index, name='th_index'),
    path("html/theme/<int:th_id>/", views.th_detail, name='th_detail'),

    path('html/review/create/<int:th_id>/', views.review_create, name='review_create'),
    path('html/theme/create/', views.theme_create, name='theme_create'),


]
