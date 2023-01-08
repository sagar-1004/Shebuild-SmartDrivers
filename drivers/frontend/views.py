from django.shortcuts import render, redirect
from dateutil.relativedelta import relativedelta
import datetime
from backend.models import *
import requests
from django.views.decorators.csrf import csrf_exempt
from django.core.serializers import json
# from django import Response
from rest_framework.response import Response
from django.core import serializers
import json
from django.contrib.auth import get_user_model
from uuid import UUID
from django.core.serializers.json import DjangoJSONEncoder
from django.core.serializers import serialize
import re
from .forms import NewUserForm
from django.contrib.auth import login
from django.contrib import messages
from django.contrib.auth import login, authenticate, logout  # add this
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm  # add this
from django.contrib.auth.models import User


def index(request):
    return render(request, 'index.html')

def viewdashboard(request):
    end_date = datetime.date.today()
    end_date = end_date.strftime("%Y-%m-%d")
    start_date = datetime.date.today() - relativedelta(months=1)
    start_date = start_date.strftime("%Y-%m-%d")
    y= str(request.user.id)
    p = requests.get('http://127.0.0.1:8000/api/hospitalview/'+y)
    q = p.json()
    print(q)

    return render(request, 'dashboard.html', {'b': q ,'frmat': "All", 'end_date': end_date, 'start_date': start_date})


def login_request(request):
	if request.method == "POST":
		form = AuthenticationForm(request, data=request.POST)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				login(request, user)
				id = user.id

				return redirect('/viewdashboard')
			else:
				messages.error(request, "Invalid username or password.")
		else:
			messages.error(request, "Invalid username or password.")
	form = AuthenticationForm()
	return render(request, 'login.html', context={"login_form": form})


def register_request(request):
	if request.method == "POST":
		form = NewUserForm(request.POST)
		if form.is_valid():
			user = form.save()
			login(request, user)
			messages.success(request, "Registration successful.")
			return redirect('/')
		messages.error(request, "Unsuccessful registration. Invalid information.")
	form = NewUserForm()
	return render(request, 'signup.html', context={"register_form": form})


def logout_request(request):
	logout(request)
	messages.info(request, "You have successfully logged out.")
	return redirect('/index')



def viewequip(request):
    end_date = datetime.date.today()
    end_date = end_date.strftime("%Y-%m-%d")
    start_date = datetime.date.today() - relativedelta(months=1)
    start_date = start_date.strftime("%Y-%m-%d")
    y = str(request.user.id)
    p = requests.get('http://127.0.0.1:8000/api/hospitalview/'+y)
    q = p.json()
    print(q)

    return render(request, 'equip.html', {'b': q, 'frmat': "All", 'end_date': end_date, 'start_date': start_date})

@csrf_exempt	
def putequip(request):
    if request.method == 'POST':
        id = request.POST["id"]
        username = request.POST["username"]
        name = request.POST["name"]
        longitude = request.POST["longitude"]
        lattitude = request.POST["lattitude"]
        address = request.POST["address"]
        ICU_bed = request.POST["ICU_bed"]
        bed = request.POST["bed"]
        ventilator = request.POST["ventilator"]
        dialysis = request.POST["dialysis"]
        Anesthesia_machine = request.POST["Anesthesia_machine"]

        context = {
            
         	"username": username,
           	"name": name,
           	"longitude": longitude,
          	"lattitude": lattitude,
         	"address": address,
            "ICU_bed" : ICU_bed,
            "bed" : bed,
            "ventilator" : ventilator,
            "dialysis" : dialysis,
            "Anesthesia_machine" : Anesthesia_machine,

        }
    p = requests.put("http://127.0.0.1:8000/api/hospitalview/"+id, context)
    print (p)
    return redirect("http://127.0.0.1:8000/viewequip")


