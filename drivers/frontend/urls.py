from django.urls import path,include

from frontend import views
from frontend.views import index
from rest_framework.routers import DefaultRouter


urlpatterns = [

    path('', views.index),
    path('viewdashboard', views.viewdashboard, name="viewdashboard"),
    path("login", views.login_request, name="login"),
    path("register", views.register_request, name="register"),
]
