from ratelimit.decorators import ratelimit

# ruleid:missing-ratelimit
def missing_view(request):
    pass

# ruleid:missing-ratelimit
@csrf_exempt
def other_decorator(request):
    pass

# ok:missing-ratelimit
@ratelimit(key=’user’, rate=’10/s’)
def my_view(request):
    pass

# ok:missing-ratelimit
@ratelimit(key='ip', rate='100/h')
def secondview(request):
    pass
