def bad1(var):
    # ruleid: sqlalchemy-groupby-sql-injection
    session.query(MyClass).group_by("foo={}".format(var))

def bad2(var):
    # ruleid: sqlalchemy-groupby-sql-injection
    query = cls.query.join(DeploymentPermission).group_by(
        "oops{}".format(var)
    )

def bad3(var):
    # ruleid: sqlalchemy-groupby-sql-injection
    query = cls.query.group_by(
        "oops{}".format(var)
    )

def bad4(var):
    # ruleid: sqlalchemy-groupby-sql-injection
    query = query.group_by("oops{}".format(var)).limit(limit)

def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-groupby-sql-injection
    query = cls.query(DeploymentPermission).group_by(
        cls.id == DeploymentPermission.token_id,
    )

def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-groupby-sql-injection
    query = cls.query.join(DeploymentPermission).group_by(
        cls == hello
    )

def ok3(var):
    # ok: sqlalchemy-groupby-sql-injection
    query = cls.query.group_by(
        "oops{}".format(var=3)
    )

def ok4(var):
    # ok: sqlalchemy-groupby-sql-injection
    query = query.group_by(desc(Scan.started_at)).limit(limit)

