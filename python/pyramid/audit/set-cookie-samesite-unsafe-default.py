from pyramid import httpexceptions as exc
from pyramid.view import view_config

### True positives ###


@view_config(route_name='my_view')
def my_bad_view3(request):
    response = request.response
    # ruleid: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie('MY_COOKIE', value='MY_COOKIE_VALUE',
                        secure=True, httponly=True)
    return {'foo': 'bar'}


@view_config(route_name='my_view')
def my_bad_view4(request):
    resp = exc.HTTPFound(location=request.referer or request.application_url)
    # ruleid: pyramid-set-cookie-samesite-unsafe-default
    resp.set_cookie('MY_COOKIE', secure=True, httponly=True)
    return resp


### True negatives ###

@view_config(route_name='my_view')
def my_good_view1(request):
    response = request.response
    # ok: pyramid-set-cookie-samesite-unsafe-default
    response.set_cookie('MY_COOKIE', value='MY_COOKIE_VALUE',
                        secure=True, httponly=True, samesite='Lax')
    return {'foo': 'bar'}


@view_config(route_name='my_view')
def my_good_view3(request):
    resp = exc.HTTPFound(location=request.referer or request.application_url)
    # ok: pyramid-set-cookie-samesite-unsafe-default
    resp.set_cookie('MY_COOKIE', secure=True, httponly=True, samesite='Lax')
    return resp


@view_config(route_name='my_view')
def my_good_view4(request):
    resp = exc.HTTPFound(location=request.referer or request.application_url)
    # ok: pyramid-set-cookie-samesite-unsafe-default
    resp.set_cookie('MY_COOKIE', **global_cookie_flags)
    return resp
