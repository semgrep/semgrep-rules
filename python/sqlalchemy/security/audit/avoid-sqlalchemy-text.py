from sqlalchemy import text

@view_config(route_name='home_bad', renderer='my_app:templates/mytemplate.jinja2')
def my_bad_home(request):
    try:
        param = request.params['foo']
        query = request.dbsession.query(models.MyModel)

        search_non_string = text(5)
        # ok: avoid-sqlalchemy-text
        one = query.distinct(search_non_string)

        search_bind_params = text(":n").bindparams(n=5)
        # ok: avoid-sqlalchemy-text
        one = query.distinct(search_bind_params)

        search_param = text(param)
        # ok: avoid-sqlalchemy-text
        one = query.distinct(search_param)

        search_fixed_string = text("foo")
        # ok: avoid-sqlalchemy-text
        one = query.distinct(search_fixed_string)

        search_param_concat_prefix = "foo" + param
        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(search_param_concat_prefix))

        search_param_concat_suffix = param + "bar"
        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(search_param_concat_suffix))

        search_param_f_string = f"foo{param}bar"
        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(search_param_f_string))

        search_param_format = "foo{}bar".format(param)
        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(search_param_format))

        search_param_percent_format = "foo %s bar" % param
        # ruleid: avoid-sqlalchemy-text
        one = query.distinct(text(search_param_percent_format))
    except SQLAlchemyError:
        return Response("Database error", content_type='text/plain', status=500)
    return {'one': one, 'project': 'my_proj'}
