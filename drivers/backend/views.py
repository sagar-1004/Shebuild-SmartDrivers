from rest_framework import status, viewsets
import requests
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import action
from rest_framework import serializers
from django.core.files.storage import FileSystemStorage
from django.core.files.base import ContentFile
from django.shortcuts import render, HttpResponse, redirect
import csv
from .models import *
# from .serializer import *
# Create your views here.

# Generate CSV File lab_elmts List


def home(request):
    return render(request, 'base.html')

