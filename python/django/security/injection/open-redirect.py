from django.shortcuts import redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.utils.http import is_safe_url

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

def fine(request):
    # ok
    return HttpResponseRedirect(request.get_full_path())

def url_validation(request):
    # this will fire for now until we can filter out is_safe_url
    next = request.POST.get('next', request.GET.get('next'))
    if (next or not request.is_ajax()) and not is_safe_url(url=next, allowed_hosts=request.get_host()):
        next = "/index"
    response = HttpResponseRedirect(next) if next else HttpResponse(status=204)
    return response