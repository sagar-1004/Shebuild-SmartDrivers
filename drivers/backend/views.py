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
        
        bed_count = request.GET.get('bed')
        ICU_bed_count = request.GET.get('ICU_bed')
        ventilator_count  = request.GET.get('ventilator')
        dialysis_count = request.GET.get('dialysis')
        Anesthesia_count = request.GET.get('anasthesia')
        
        queryset = Hospital.objects.filter(bed__gte=bed_count,ICU_bed__gte=ICU_bed_count,ventilator__gte=ventilator_count,dialysis__gte=dialysis_count,Anesthesia_machine__gte=Anesthesia_count)
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
