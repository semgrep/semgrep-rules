from pyramid.view import view_config
from pyramid.request import Response


@view_config(route_name='bad_route', renderer='pyramid_test_mako:templates/mytemplate.mako')
def my_bad_view1(request):
    param = request.params.get('p', '')
    content = """
<html>
    <body>
        <p>Param: {0}</p>
    </body>
</html>""".format(param)
    # ruleid: pyramid-direct-use-of-response
    return Response(content)


@view_config(route_name='bad_route', renderer='pyramid_test_mako:templates/mytemplate.mako')
def my_bad_view2(request):
    param = request.params.get('p', '')
    # ruleid: pyramid-direct-use-of-response
    request.response.body = """
<html>
    <body>
        <p>Param: {0}</p>
    </body>
</html>""".format(param)
    return request.response


@view_config(route_name='good_route', renderer='pyramid_test_mako:templates/mytemplate.mako')
def my_good_view1(request):
    # ok: pyramid-direct-use-of-response
    return {'project': 'pyramid_test_mako', 'Param': request.params.get('p', '')}


@view_config(route_name='good_route')
def my_good_view2(request):
    # ok: pyramid-direct-use-of-response
    request.response.body = "HELLO!"
    return request.response
