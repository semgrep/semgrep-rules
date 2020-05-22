from django.http import HttpResponse
import datetime

def current_datetime(request):
    # ok
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    return "Hey there! {}!".format(pickle.loads(b64decode(html)))

def current_datetime(request):
    # ruleid: avoid-insecure-deserialization
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    return "Hey there! {}!".format(pickle.loads(user_obj))

def current_datetime(request):
    # ok (TODO: should fail)
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    
    return "Hey there! {}!".format(pickle.loads(b64decode(user_obj)))
