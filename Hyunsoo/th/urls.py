from django.urls import path, include
from .views import helloAPI, home_recommand, show_review, show_theme, all_theme

urlpatterns = [
    path("hello/", helloAPI),
    path("home/<int:id>/", home_recommand),
    path("theme/<int:id>/review/", show_review),
    path("theme/<int:id>/", all_theme)
]
