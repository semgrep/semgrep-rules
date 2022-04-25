from sqlalchemy import text

# ruleid: avoid-sqlalchemy-text
text(5)


@view_config(route_name='home_bad', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)

        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(param))
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}


# ok
text("5")

# ok
text(":n").bindparams(n=5)
