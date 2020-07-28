from django.db import models
from django.db.models import Model, CharField, TextField, URLField, EmailField, SlugField, UUIDField, IntegerField

class FakeModel(Model):
    # ok
    fieldChar = CharField(
        max_length=200,
        blank=True)
    # ok
    fieldText = TextField(blank=True)
    # ok
    fieldSlug = SlugField(blank=True)
    # ok
    fieldEmail = EmailField(blank=True)
    # ok
    fieldUUID = UUIDField(blank=True)
    # ruleid: nontext-field-must-set-null-true
    fieldInt = IntegerField(
        blank=True,
        max_value=30
    )
    # ok
    fieldIntNull = IntegerField(
        null=True,
        blank=True,
        max_value=100
    )

def fake(**kwargs):
    pass

def nope():
    # ok
    return fake(blank=True)
