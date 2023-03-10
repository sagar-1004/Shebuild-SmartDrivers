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
from .serializer import *
# from .serializer import *
# Create your views here.

# Generate CSV File lab_elmts List


def home(request):
    return render(request, 'base.html')


class Hospitalview(APIView):

    def get(self, request, pk=None):
        id = pk
        if id is not None:
            queryset = Hospital.objects.filter(username=id)
            serializer1_class = hospitalSerializer(queryset, many=True)
            # print(queryset)
            return Response(serializer1_class.data)
        
       
        
        queryset = Hospital.objects.filter(bed__gte=0,ICU_bed__gte=0,ventilator__gte=0,dialysis__gte=0,Anesthesia_machine__gte=0)
        serializer_class = hospitalSerializer(queryset, many=True)
        return Response(serializer_class.data)

    def put(self, request, pk):
        id = pk
        queryset = Hospital.objects.get(id=id)
        serializer_class = hospitalSerializer(queryset, data=request.data)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({'msg': serializer_class.data})
        return Response(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        id = pk
        member = Hospital.objects.get(skill_id=pk)
        member.delete()
        return Response({'msg': 'Deleted'})

    def post(self, request):
        serializer_class = hospitalSerializer(data=request.data)
        if serializer_class.is_valid():
            serializer_class.save()
            return redirect('/viewdashboard')
        return Response(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, pk):
        id = pk
        queryset = Hospital.objects.get(skill_id=id)
        serializer_class = hospitalSerializer(
            queryset, data=request.data, partial=True)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({'msg': 'Partial Data Updated', 'data': serializer_class.data})
        return Response(serializer_class.errors)


class Notificationview(APIView):

    def get(self, request, pk=None):
        id = pk
        if id is not None:
            queryset = Notification.objects.filter(hospitalID=id)
            serializer1_class = notificationSerializer(queryset, many=True)
            # print(queryset)
            return Response(serializer1_class.data)
        queryset = Notification.objects.all()
        serializer_class = notificationSerializer(queryset, many=True)
        return Response(serializer_class.data)

    

    def post(self, request):
        serializer_class = notificationSerializer(data=request.data)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response('successfull')
        return Response(serializer_class.errors, status=status.HTTP_400_BAD_REQUEST)

    
