from django.db.models.expressions import RawSQL
from django.http import HttpResponse

##### RawSQL() True Positives #########
def get_user_age(request):
  user_name = request.get('user_name')
  # ruleid: sql-injection
  user_age = RawSQL('SELECT user_age FROM myapp_person where user_name = %s' % user_name)
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age(request):
  user_name = request.get('user_name')
  # pending https://github.com/returntocorp/sgrep/issues/326
  # todoruleid: sql-injection
  user_age = RawSQL(f'SELECT user_age FROM myapp_person where user_name = {user_name}')
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_user_age(request):
  user_name = request.get('user_name')
  # ruleid: sql-injection
  user_age = RawSQL('SELECT user_age FROM myapp_person where user_name = %s'.format(user_name))
  html = "<html><body>User Age %s.</body></html>" % user_age
  return HttpResponse(html)

def get_users(request):
  client_id = request.headers.get('client_id')
  # ruleid: sql-injection
  users = RawSQL('SELECT * FROM myapp_person where client_id = %s'.format(client_id))
  html = "<html><body>Users %s.</body></html>" % users
  return HttpResponse(html)

##### raw() True Negatives #########
def get_users(request):
  client_id = request.headers.get('client_id')
  # using param list is ok 
  users = RawSQL('SELECT * FROM myapp_person where client_id = %s', (client_id,))
  html = "<html><body>Users %s.</body></html>" % users
  return HttpResponse(html)
