from django.urls import path,include

from frontend import views
from frontend.views import index
from rest_framework.routers import DefaultRouter


urlpatterns = [

    path('', views.index),
    path("index", views.index, name="index"),
    path('viewdashboard', views.viewdashboard, name="viewdashboard"),
    path('viewnotification', views.viewnotification, name="viewnotification"),
    path('putequip/', views.putequip, name="putequip"),
    path('viewequip', views.viewequip, name="viewequip"),
    path("login", views.login_request, name="login"),
    path("register", views.register_request, name="register"),
    path("logout", views.logout_request, name="logout"),
]
