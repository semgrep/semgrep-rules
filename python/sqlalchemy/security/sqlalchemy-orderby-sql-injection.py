# ruleid: sqlalchemy-orderby-sql-injection
def bad1(var):
    session.query(MyClass).order_by("foo={}".format(var))

# ruleid: sqlalchemy-orderby-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).order_by(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-orderby-sql-injection
def bad3(var):
    query = cls.query.order_by(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-orderby-sql-injection
def bad4(var):
    query = query.order_by("oops{}".format(var)).limit(limit)

# ok: sqlalchemy-orderby-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).order_by(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-orderby-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).order_by(
        cls == hello
    )

# ok: sqlalchemy-orderby-sql-injection
def ok3(var):
    query = cls.query.order_by(
        "oops{}".format(var=3)
    )

# ok: sqlalchemy-orderby-sql-injection
def ok4():
    query = query.order_by(desc(Scan.started_at)).limit(limit)

