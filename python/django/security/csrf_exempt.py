from django.http import HttpResponse
# ruleid: django-csrf_exempt
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def my_view(request):
    return HttpResponse('Hello world')