from django.db import connection

##### True Positives #########
def fetch_name_1(request):
  # ruleid: sql-injection-db-cursor-execute
  baz = request.data.get("baz") 
  with connection.cursor() as cursor:
      cursor.execute(f"UPDATE bar SET foo = 1 WHERE baz = {baz}")
      cursor.execute(f"SELECT foo FROM bar WHERE baz = {baz}")
      row = cursor.fetchone()
  return row

def fetch_name_2(request):
  # ruleid: sql-injection-db-cursor-execute
  baz = request.data.get("baz") 
  baz = request.data.get("baz") 
  with connection.cursor() as cursor:
      cursor.execute("SELECT foo FROM bar WHERE baz = %s" % baz)
      row = cursor.fetchone()
  return row

def fetch_name_3(request):
  # ruleid: sql-injection-db-cursor-execute
  baz = request.data.get("baz") 
  baz = request.data.get("baz") 
  with connection.cursor() as cursor:
      cursor.execute("SELECT foo FROM bar WHERE baz = %s".format(baz))
      row = cursor.fetchone()
  return row


##### True Negatives #########
def fetch_name_4(request):
  # using param list is ok
  baz = request.data.get("baz") 
  with connection.cursor() as cursor:
      cursor.execute("UPDATE bar SET foo = 1 WHERE baz = %s", [baz])
      cursor.execute("SELECT foo FROM bar WHERE baz = %s", [baz])
      row = cursor.fetchone()

  return row