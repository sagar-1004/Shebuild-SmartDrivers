from rest_framework import serializers
from .models import *

class hospitalSerializer(serializers.ModelSerializer):
    class Meta:
        model=Hospital
        fields='__all__'