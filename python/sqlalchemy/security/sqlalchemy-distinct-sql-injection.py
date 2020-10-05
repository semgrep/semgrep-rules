# ruleid: sqlalchemy-distinct-sql-injection
def bad1(var):
    session.query(MyClass).distinct("foo={}".format(var))

# ruleid: sqlalchemy-distinct-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).distinct(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-distinct-sql-injection
def bad3(var):
    query = cls.query.distinct(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-distinct-sql-injection
def bad4(var):
    query = query.distinct("oops{}".format(var)).limit(limit)

# ok: sqlalchemy-distinct-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).distinct(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-distinct-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).distinct(
        cls == hello
    )

# ok: sqlalchemy-distinct-sql-injection
def ok3(var):
    query = cls.query.distinct(
        "oops{}".format(var=3)
    )

# ok: sqlalchemy-distinct-sql-injection
def ok4(var):
    query = query.distinct(desc(Scan.started_at)).limit(limit)

