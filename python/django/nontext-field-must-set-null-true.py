from django.db import models
from django.db.models import Model, CharField, IntegerField

class FakeModel(Model):
    fieldOne = CharField(
        max_length=200,
        blank=True)
    fieldTwo = IntegerField(
        blank=True,
        max_value=30
    )
    fieldThree = IntegerField(
        null=True,
        blank=True,
        max_value=100
    )

def fake(**kwargs):
    pass

def nope():
    return fake(blank=True)
