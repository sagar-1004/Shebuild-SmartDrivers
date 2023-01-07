from django.db import models
import uuid


class driver(models.Model):
    id = models.UUIDField(
        primary_key=True, editable=False, default=uuid.uuid4)
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=50)
    address = models.DateField(auto_now=True)
    phone = models.CharField(max_length=10)

class Hospital(models.Model):
    id = models.UUIDField(primary_key=True, editable=False, default=uuid.uuid4)
    name = models.CharField(max_length=255)
    longitude = models.DecimalField(decimal_places=8,max_digits=12)
    lattitude = models.DecimalField(decimal_places=8,max_digits=12)
    address = models.CharField(max_length=400)
    ICU_bed = models.PositiveIntegerField(default=0)
    bed = models.PositiveIntegerField(default=0)
    ventilator = models.PositiveIntegerField(default=0)
    dialysis = models.PositiveIntegerField(default=0)
    Anesthesia_machine = models.PositiveIntegerField(default=0)
    

class Notification(models.Model):
    id = models.UUIDField(primary_key=True,editable=False,default=uuid.uuid4)
    hospitalID = models.ForeignKey(Hospital,on_delete=models.CASCADE)
    gender = models.CharField(max_length=5)
    bloodgroup = models.CharField(max_length=5)
    diabetic = models.BooleanField(default=False)
    blood_pressure_patient = models.BooleanField(default=False)
    
