from pyramid import httpexceptions as exc
from pyramid.view import view_config

### True positives ###


@view_config(route_name='my_view')
def my_bad_view1(request):
    response = request.response
    # ruleid: pyramid-set-cookie-httponly
    response.set_cookie('MY_COOKIE', value='MY_COOKIE_VALUE', secure=True)
    return {'foo': 'bar'}


@view_config(route_name='my_view')
def my_bad_view2(request):
    response = request.response
    # ruleid: pyramid-set-cookie-httponly
    response.set_cookie('MY_COOKIE', httponly=False,
                        value='MY_COOKIE_VALUE', secure=True)
    return {'foo': 'bar'}


@view_config(route_name='my_view')
def my_bad_view3(request):
    resp = exc.HTTPFound(location=request.referer or request.application_url)
    # ruleid: pyramid-set-cookie-httponly
    resp.set_cookie('MY_COOKIE', value='MY_COOKIE_VALUE',
                    secure=True)
    return resp


### True negatives ###

@view_config(route_name='my_view')
def my_good_view1(request):
    response = request.response
    # ok: pyramid-set-cookie-httponly
    response.set_cookie('MY_COOKIE', value='MY_COOKIE_VALUE',
                        secure=True, httponly=True)
    return {'foo': 'bar'}


@view_config(route_name='my_view')
def my_good_view2(request):
    resp = exc.HTTPFound(location=request.referer or request.application_url)
    # ok: pyramid-set-cookie-httponly
    resp.set_cookie('MY_COOKIE', secure=True,
                    httponly=True, value='MY_COOKIE_VALUE')
    return resp
