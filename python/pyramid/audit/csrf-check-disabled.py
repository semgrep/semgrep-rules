from pyramid.view import view_config


@view_config(
    route_name='home_bad1',
    # ruleid: pyramid-csrf-check-disabled
    require_csrf=False,
    renderer='my_app:templates/mytemplate.jinja2'
)
def my_bad_home1(request):
    try:
        query = request.dbsession.query(models.MyModel)
        one = query.filter(models.MyModel.name == 'one').one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}


@view_config(
    route_name='home_bad1',
    # ok: pyramid-csrf-check-disabled
    require_csrf=True,
    renderer='my_app:templates/mytemplate.jinja2'
)
def my_good_home1(request):
    try:
        query = request.dbsession.query(models.MyModel)
        one = query.filter(models.MyModel.name == 'one').one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}
