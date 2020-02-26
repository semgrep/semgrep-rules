from django.db import models
from django.db.models import Model, CharField, IntegerField

class FakeModel(Model):
    # ok
    fieldOne = CharField(
        max_length=200,
        blank=True)
    # ruleid: nontext-field-must-set-null-true
    fieldTwo = IntegerField(
        blank=True,
        max_value=30
    )
    # ok
    fieldThree = IntegerField(
        null=True,
        blank=True,
        max_value=100
    )

def fake(**kwargs):
    pass

def nope():
    # ok
    return fake(blank=True)
