import models
from django.http import HttpResponse
from app import get_price, deny, buy, fetch_obj


class Person(models.Model):
    first_name = models.CharField(...)
    last_name = models.CharField(...)
    birth_date = models.DateField(...)


##### True Positives #########
def test1(request):
    tid = request.POST.get("tid")

    price = get_price()

    # ruleid: nan-injection
    x = float(tid)

    if x < price:
        return deny()
    return buy()

def test2(request):
    tid = request.POST.get("tid")

    # ruleid: nan-injection
    bool(tid)

    # ruleid: nan-injection
    complex(tid)

def test3(request, something_else):
    tid = request.GET['tid']

    # ruleid: nan-injection
    float(tid)

    # ruleid: nan-injection
    bool(tid)

    # ruleid: nan-injection
    complex(tid)

def ok1(request, something_else):
    tid = request.POST.get("tid")

    obj = fetch_obj(tid)

    # ok: nan-injection
    float(obj.num)

def ok2(request, something_else):
    tid = request.POST.get("tid")

    # ok: nan-injection
    int(float(tid))

    # ok: nan-injection
    float(int(tid))

    # ok: nan-injection
    int(bool(tid))

def ok3(request):
    tid = request.POST.get("tid")

    if tid.lower() == "nan":
        raise ValueError

    # ok: nan-injection 
    num = float(tid)
    if num > get_price():
        buy()
    deny()