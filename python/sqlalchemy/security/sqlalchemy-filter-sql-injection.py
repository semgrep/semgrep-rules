# ruleid: sqlalchemy-filter-sql-injection
def bad1(var):
    session.query(MyClass).filter("foo={}".format(var))

# ruleid: sqlalchemy-filter-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).filter(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-filter-sql-injection
def bad3(var):
    query = cls.query.filter(
        "oops{}".format(var)
    )

# ok: sqlalchemy-filter-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).filter(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-filter-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).filter(
        cls == hello
    )

# ok: sqlalchemy-filter-sql-injection
def ok3(var):
    query = cls.query.filter(
        "oops{}".format(var=3)
    )

