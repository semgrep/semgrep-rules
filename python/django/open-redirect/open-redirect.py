from django.shortcuts import redirect

def my_view(request):
    # ruleid: open-redirect
    url = request.headers.get('referrer')
    print("something")
    return redirect(url)

def my_view(request):
    # ok
    url = "https://lmnop.qrs"
    return redirect(url)
