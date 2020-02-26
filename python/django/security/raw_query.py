query = 'SELECT * FROM myapp_person WHERE last_name = %s' % lname
# ruleid: avoid-raw-sql
Person.objects.raw(query)


from django.db.models.expressions import RawSQL
queryset.annotate(val=RawSQL("select col from sometable where othercol = %s", (someparam,)))