from django.urls import path, include
from keys import views
from .views import helloAPI, Random_Recommand_Theme

app_name = 'keys'

urlpatterns = [
    path("api/hello/", helloAPI),
    path("api/home/<int:id>/",Random_Recommand_Theme),

]