from django.urls import path, include
from keys import views
from .views import helloAPI, Random_Recommand_Theme, show_Theme, search, FT_Recommand_Theme, diff_Recommand_Theme

app_name = 'keys'

urlpatterns = [
    path("api/hello/", helloAPI),
    path("api/home/<int:id>/", Random_Recommand_Theme),
    path("api/home/ft/<int:id>/", FT_Recommand_Theme),
    path("api/home/diff/<int:id>/", diff_Recommand_Theme),
    path("api/theme/<int:id>/", show_Theme),
    path("thimg/<int:id>", views.image, name='image'),
    path("api/search/<str:id>", search),
    # -----------HTML
    path("html/home/", views.home, name='home'),
    path("html/er/", views.er_index, name='er_index'),
    path("html/er/<int:er_id>/", views.er_detail, name='er_detail'),
    path("html/er/create/", views.er_create, name='er_create'),
    path("html/er/modify/<int:er_id>", views.er_modify, name='er_modify'),
    path("html/er/delete/<int:er_id>", views.er_delete, name='er_delete'),
    path("html/th/", views.th_index, name='th_index'),
    path("html/th/<int:th_id>/", views.th_detail, name='th_detail'),
    path("html/th/create/<int:er_id>/", views.theme_create, name='theme_create'),
    path("html/th/modify/<int:th_id>", views.th_modify, name='th_modify'),
    path("html/th/delete/<int:th_id>", views.th_delete, name='th_delete'),

]