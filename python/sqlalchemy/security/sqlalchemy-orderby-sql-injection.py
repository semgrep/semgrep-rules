def bad1(var):
    # ruleid: sqlalchemy-orderby-sql-injection
    session.query(MyClass).order_by("foo={}".format(var))

def bad2(var):
    # ruleid: sqlalchemy-orderby-sql-injection
    query = cls.query.join(DeploymentPermission).order_by(
        "oops{}".format(var)
    )

def bad3(var):
    # ruleid: sqlalchemy-orderby-sql-injection
    query = cls.query.order_by(
        "oops{}".format(var)
    )

def bad4(var):
    # ruleid: sqlalchemy-orderby-sql-injection
    query = query.order_by("oops{}".format(var)).limit(limit)

def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-orderby-sql-injection
    query = cls.query(DeploymentPermission).order_by(
        cls.id == DeploymentPermission.token_id,
    )

def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-orderby-sql-injection
    query = cls.query.join(DeploymentPermission).order_by(
        cls == hello
    )

def ok3(var):
    # ok: sqlalchemy-orderby-sql-injection
    query = cls.query.order_by(
        "oops{}".format(var=3)
    )

def ok4():
    # ok: sqlalchemy-orderby-sql-injection
    query = query.order_by(desc(Scan.started_at)).limit(limit)

