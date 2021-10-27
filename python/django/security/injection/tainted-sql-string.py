from django.http import HttpResponse

class Person(models.Model):
    first_name = models.CharField(...)
    last_name = models.CharField(...)
    birth_date = models.DateField(...)

##### True Positives #########
def get_user_age1(request):
  user_name = request.POST.get('user_name')
  # ruleid: tainted-sql-string
  user_age = Person.objects.raw('SELECT user_age FROM myapp_person where user_name = %s' % user_name)
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age2(request):
  user_name = request.POST.get('user_name')
  # ruleid: tainted-sql-string
  user_age = Person.objects.raw(f"SELECT user_age FROM myapp_person where user_name = {user_name}")
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age3(request):
  user_name = request.POST.get('user_name')
  # ruleid: tainted-sql-string
  user_age = Person.objects.raw('SELECT user_age FROM myapp_person where user_name = %s'.format(user_name))
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age4(request):
  user_name = request.POST.get('user_name')
  # ruleid: tainted-sql-string
  user_age = Person.objects.raw('SELECT user_age FROM myapp_person where user_name = ' + user_name)
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age5(request):
  user_name = request.GET.get('user_name')
  query = "SELECT user_age FROM myapp_person where user_name = %s"
  # ruleid: tainted-sql-string
  user_age = Person.objects.raw(query % user_name)
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age6(request):
  query = "SELECT user_age FROM myapp_person where user_name = {}"
  # todoruleid: tainted-sql-string
  user_age = Person.objects.raw(query.format(request.GET.get('user_name')))
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_users1(request):
  client_id = request.headers.get('client_id')
  # ruleid: tainted-sql-string
  users = Person.objects.raw('SELECT * FROM myapp_person where client_id = %s' % client_id)
  html = "<html><body>Users %s.</body></html>" % users
  return HttpResponse(html)

def get_users2(request):
  client_id = request.headers.get('client_id')
  # ruleid: tainted-sql-string
  users = Person.objects.raw(f'SELECT * FROM myapp_person where client_id = {client_id}')
  html = "<html><body>Users %s.</body></html>" % users
  return HttpResponse(html)

##### True Negatives #########
def get_user_age_ok(request):
  user_name = request.POST.get('user_name')
  # ok: tainted-sql-string
  user_age = Person.objects.filter(user_name=user_name).first()
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_users_ok(request):
  client_id = request.headers.get('client_id')
  # ok: tainted-sql-string
  users = Person.objects.raw('SELECT * FROM myapp_person where client_id = %s', (client_id,))
  html = "<html><body>Users %s.</body></html>" % users
  return HttpResponse(html)
