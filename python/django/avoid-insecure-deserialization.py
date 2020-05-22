from django.http import HttpResponse
import datetime

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    # ok
    return "Hey there! {}!".format(pickle.loads(b64decode(html)))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    # ruleid: avoid-insecure-deserialization (TODO)
    return "Hey there! {}!".format(pickle.loads(user_obj))
    #return HttpResponse(html)

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    # ruleid: avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(b64decode(user_obj)))
    #return HttpResponse(html)