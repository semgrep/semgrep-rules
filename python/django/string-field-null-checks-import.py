from django.db import models
from django.db.models import Model, CharField, IntegerField

class FakeModel(Model):
    fieldOne = CharField(
        max_length=200,
        unique=True)
    fieldTwo = CharField(
        unique=True,
        blank=True,
        max_length=30
    )
    fieldThree = CharField(
        unique=True,
        null=True,
        blank=True,
        max_length=100
    )
    notText = IntegerField(
        max_value=255
    )

def fake(**kwargs):
    pass

def nope():
    return fake(unique=True, blank=True)
