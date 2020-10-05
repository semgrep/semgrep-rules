def bad1(var):
    # ruleid: sqlalchemy-filter-sql-injection
    session.query(MyClass).filter("foo={}".format(var))

def bad2(var):
    # ruleid: sqlalchemy-filter-sql-injection
    query = cls.query.join(DeploymentPermission).filter(
        "oops{}".format(var)
    )

def bad3(var):
    # ruleid: sqlalchemy-filter-sql-injection
    query = cls.query.filter(
        "oops{}".format(var)
    )

def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-filter-sql-injection
    query = cls.query(DeploymentPermission).filter(
        cls.id == DeploymentPermission.token_id,
    )

def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    # ok: sqlalchemy-filter-sql-injection
    query = cls.query.join(DeploymentPermission).filter(
        cls == hello
    )

def ok3(var):
    # ok: sqlalchemy-filter-sql-injection
    query = cls.query.filter(
        "oops{}".format(var=3)
    )

