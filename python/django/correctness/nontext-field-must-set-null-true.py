from django.db import models


class FakeModel(models.Model):
    # ok: nontext-field-must-set-null-true
    fieldChar = models.CharField(
        max_length=200,
        blank=True)
    # ok: nontext-field-must-set-null-true
    fieldText = models.TextField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldSlug = models.SlugField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldEmail = models.EmailField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldURL = models.URLField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldUUID = models.UUIDField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldManyToMany = models.ManyToManyField("self", blank=True)
    # ruleid: nontext-field-must-set-null-true
    fieldInt = models.IntegerField(
        blank=True,
        max_value=30
    )
    # ok: nontext-field-must-set-null-true
    fieldIntNull = models.IntegerField(
        null=True,
        blank=True,
        max_value=100
    )

def fake(**kwargs):
    pass

def nope():
    # ok: nontext-field-must-set-null-true
    return fake(blank=True)
