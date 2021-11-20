from django.urls import path, include
from .views import helloAPI, home_recommand, show_review, show_theme, all_theme, show_image
from . import views
#from rest_framework_swagger

urlpatterns = [
    path("hello/", helloAPI),
    path("home/<int:id>/", home_recommand),
    path("theme/<int:id>/all/", all_theme),
    path("theme/<int:id>/img/<int:re_id>", show_image),
    path("theme/<int:id>/review/<int:re_id>", show_review),
    path("theme/<int:id>/", show_theme)
#    path("docs/", get_se)
]
