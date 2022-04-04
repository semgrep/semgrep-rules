from django.http import HttpResponse
import datetime

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ok:avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(b64decode(html)))

# pickle tests

def current_datetime(request):
    user_obj = b64decode(request.cookies.get('uuid'))
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(user_obj))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(user_obj))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(b64decode(user_obj)))

def current_datetime(request):
    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(pickle.loads(b64decode(request.cookies.get('uuid'))))

# Other libraries

def current_datetime(request):
    user_obj = b64decode(request.cookies.get('uuid'))
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(_pickle.loads(user_obj))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(cPickle.loads(user_obj))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(dill.loads(b64decode(user_obj)))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(shelve.loads(user_obj))

def current_datetime(request):
    user_obj = request.cookies.get('uuid')
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now

    # ruleid:avoid-insecure-deserialization
    return "Hey there! {}!".format(yaml.load(b64decode(user_obj)))
