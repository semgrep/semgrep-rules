from pyramid.view import view_config

### True positives ###

@view_config(route_name='home_bad1', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home1(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        
        # ruleid: pyramid-sqlalchemy-sql-injection
        one = query.distinct("foo={}".format(param))
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

@view_config(route_name='home_bad2', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home2(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        
        # ruleid: pyramid-sqlalchemy-sql-injection
        one = query.join(DeploymentPermission).having("oops{}".format(param))
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

@view_config(route_name='home_bad3', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home3(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        
        # ruleid: pyramid-sqlalchemy-sql-injection
        one = query.group_by("oops{}".format(param))
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

@view_config(route_name='home_bad4', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home4(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        
        # ruleid: pyramid-sqlalchemy-sql-injection
        one = query.order_by("oops{}".format(param)).one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

@view_config(route_name='home_bad5', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home5(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        
        # ruleid: pyramid-sqlalchemy-sql-injection
        one = query.filter("oops{}".format(param)).one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}


### True negatives ###

@view_config(route_name='home_ok1', renderer='my_app:templates/mytemplate.jinja2')
def my_ok_home1(request):
    try:
        query = request.dbsession.query(models.MyModel)
        # ok: pyramid-sqlalchemy-sql-injection
        one = query.filter(models.MyModel.name == 'one').one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

@view_config(route_name='home_ok2', renderer='my_app:templates/mytemplate.jinja2')
def my_ok_home2(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)
        # ok: pyramid-sqlalchemy-sql-injection
        one = query.filter("oops{}".bindparams(param)).one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

def not_a_view(something):
    try:
        foo = something.params['foo']
        query = something.dbsession.query(models.MyModel)
        # ok: pyramid-sqlalchemy-sql-injection
        one = query.filter("{}".format(foo)).one()
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}

