from django.db import models
from django.db.models import Model

class FakeModel(Model):
    fieldOne = models.CharField(
        max_length=200,
        unique=True)
    fieldTwo = models.CharField(
        unique=True,
        blank=True,
        max_length=30
    )
    fieldThree = models.CharField(
        unique=True,
        null=True,
        blank=True,
        max_length=100
    )
    notText = models.IntegerField(
        max_value=255
    )

def fake(**kwargs):
    pass

def nope():
    return fake(unique=True, blank=True)
