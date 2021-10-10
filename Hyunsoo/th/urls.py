from django.urls import path, include
from .views import helloAPI, home_recom_random, sh_th, sh_th_gr

urlpatterns = [
    path("hello/", helloAPI),
    path("<int:id>/", home_recom_random),
    path("shth/<int:id>/", sh_th),
    path("shth/<int:id>/all/", sh_th_gr)
]
