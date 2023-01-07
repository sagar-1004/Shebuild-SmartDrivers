from django.urls import path,include

from frontend import views
from frontend.views import index
from rest_framework.routers import DefaultRouter


urlpatterns = [

    path('', views.index),
]
