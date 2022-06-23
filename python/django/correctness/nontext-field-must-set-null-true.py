from django.db import models
from ckeditor.fields import RichTextField
from phonenumber_field.modelfields import PhoneNumberField



class FakeModel(models.Model):
    # ok: nontext-field-must-set-null-true
    fieldChar = models.CharField(
        max_length=200,
        blank=True)
    # ok: nontext-field-must-set-null-true
    fieldPhone = PhoneNumberField()
    # ok: nontext-field-must-set-null-true
    fieldText = models.TextField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldSlug = models.SlugField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldEmail = models.EmailField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldFile = models.FileField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldImage = models.ImageField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldURL = models.URLField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldUUID = models.UUIDField(blank=True)
    # ok: nontext-field-must-set-null-true
    fieldManyToMany = models.ManyToManyField("self", blank=True)
    # ok: nontext-field-must-set-null-true
    fieldCKEditorRichtext = RichTextField(blank=True)
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

def scoped():
    from django.contrib.gis.db import models
    class MyModel(models.Model):
        shape = models.PolygonField(dim=3, srid=4326)
        # ok: nontext-field-must-set-null-true
        grouper_id = models.CharField(max_length=50, blank=True)

