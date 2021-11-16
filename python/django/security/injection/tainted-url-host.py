from django.http import HttpResponse
import requests

class Person(models.Model):
    first_name = models.CharField(...)
    last_name = models.CharField(...)
    birth_date = models.DateField(...)

##### True Positives #########
def ex1(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  user_age = requests.get("https://%s/%s/age" % (env, user_name))
  return HttpResponse(user_age)

def ex2(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  user_age = requests.get("https://{}/{}/age".format(env, user_name))
  return HttpResponse(user_age)

def ex3(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  user_age = requests.get(f"https://{env}/{user_name}/age")
  return HttpResponse(user_age)

def ex4(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  user_age = requests.get(f"https://" + env + "/" + user_name + "/age")
  return HttpResponse(user_age)

def ex5(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  url = "https://{}/{}/age".format(env, user_name)
  user_age = requests.get(url)
  return HttpResponse(user_age)

def ex6(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ruleid: tainted-url-host
  url = "https://{}/{}/age".format(env, user_name)
  user_age = requests.get(url)
  return HttpResponse(user_age)

def ex7(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  url = "https://%s/%s/age"
  # ruleid: tainted-url-host
  user_age = requests.get(url % (env, user_name))
  return HttpResponse(user_age)

def ex8(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  url = "https://{}/{}/age"
  # ruleid: tainted-url-host
  user_age = requests.get(url.format(env, user_name))
  return HttpResponse(user_age)

##### True Negatives #########
def ok1(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ok: tainted-url-host
  user_age = requests.get("https://example.com/%s/%s/age" % (env, user_name))
  return HttpResponse(user_age)

def ok2(request):
  env = request.POST.get('env')
  user_name = request.POST.get('user_name')
  # ok: tainted-url-host
  user_age = requests.get("https://example.com/%s/%s/age".format(env, user_name))
  return HttpResponse(user_age)
