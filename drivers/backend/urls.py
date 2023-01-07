from django.urls import path
from . import views


urlpatterns = [
    path('', views.home),
    path('hospitalview', views.Hospitalview.as_view()),
    path('hospitalview/<str:pk>', views.Hospitalview.as_view()),
   	
]
