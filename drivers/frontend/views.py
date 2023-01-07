from django.shortcuts import render, HttpResponse, redirect
from dateutil.relativedelta import relativedelta
import datetime
from backend.models import *
import requests
from django.views.decorators.csrf import csrf_exempt
from django.core.serializers import json
from django.http import JsonResponse
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

				return redirect('/viewskill')
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
