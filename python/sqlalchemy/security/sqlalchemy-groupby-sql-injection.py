# ruleid: sqlalchemy-groupby-sql-injection
def bad1(var):
    session.query(MyClass).group_by("foo={}".format(var))

# ruleid: sqlalchemy-groupby-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).group_by(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-groupby-sql-injection
def bad3(var):
    query = cls.query.group_by(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-groupby-sql-injection
def bad4(var):
    query = query.group_by("oops{}".format(var)).limit(limit)

# ok: sqlalchemy-groupby-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).group_by(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-groupby-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).group_by(
        cls == hello
    )

# ok: sqlalchemy-groupby-sql-injection
def ok3(var):
    query = cls.query.group_by(
        "oops{}".format(var=3)
    )

# ok: sqlalchemy-groupby-sql-injection
def ok4(var):
    query = query.group_by(desc(Scan.started_at)).limit(limit)

