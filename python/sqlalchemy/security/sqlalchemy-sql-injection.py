# ruleid: sqlalchemy-sql-injection
def bad1(var):
    session.query(MyClass).distinct("foo={}".format(var))

# ruleid: sqlalchemy-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).having(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-sql-injection
def bad3(var):
    query = cls.query.group_by(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-sql-injection
def bad4(var):
    query = query.order_by("oops{}".format(var)).limit(limit)

# ruleid: sqlalchemy-sql-injection
def bad5(var):
    query = query.filter("oops{}".format(var)).limit(limit)

# ok: sqlalchemy-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).distinct(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).having(
        cls == hello
    )

# ok: sqlalchemy-sql-injection
def ok3(var):
    query = cls.query.group_by(
        var=3)

# ok: sqlalchemy-sql-injection
def ok4(var):
    query = query.order_by(desc(Scan.started_at)).limit(limit)

# ok: sqlalchemy-sql-injection
def ok5(var):
    query = query.filter(var==5).limit(limit)

# ok: sqlalchemy-sql-injection
def ok6(var):
    query = query.filter("oops{}".bindparams(var)).limit(limit)
