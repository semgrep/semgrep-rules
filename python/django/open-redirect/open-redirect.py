from django.shortcuts import redirect
from django.http import HttpResponseRedirect

def unsafe(request):
    # ruleid: open-redirect
    url = request.headers.get('referrer')
    print("something")
    return redirect(url)

def safe(request):
    # ok
    url = "https://lmnop.qrs"
    return redirect(url)

def unsafe2(request):
    # ruleid: open-redirect
    url = request.POST.get("url")
    return HttpResponseRedirect(url)


