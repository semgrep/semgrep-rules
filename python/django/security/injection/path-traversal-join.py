from django.http import HttpResponse
import os

def foo_1(request):
  # ruleid: path-traversal-join
  param = request.GET.get('param')
  file_path = os.path.join("MY_SECRET", param)
  f = open(file_path, 'r')
  return HttpResponse(content=f, content_type="text/plain")

def foo_2(request):
  # ok due to abspath
  param = request.GET.get('param')
  file_path = os.path.join("MY_SECRET", param)
  file_path = os.path.abspath(file_path)
  f = open(file_path, 'r')
  return HttpResponse(content=f, content_type="text/plain")