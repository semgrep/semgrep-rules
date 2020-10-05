# ruleid: sqlalchemy-having-sql-injection
def bad1(var):
    session.query(MyClass).having("foo={}".format(var))

# ruleid: sqlalchemy-having-sql-injection
def bad2(var):
    query = cls.query.join(DeploymentPermission).having(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-having-sql-injection
def bad3(var):
    query = cls.query.having(
        "oops{}".format(var)
    )

# ruleid: sqlalchemy-having-sql-injection
def bad4(var):
    query = query.having("oops{}".format(var)).limit(limit)

# ok: sqlalchemy-having-sql-injection
def ok1(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query(DeploymentPermission).having(
        cls.id == DeploymentPermission.token_id,
    )

# ok: sqlalchemy-having-sql-injection
def ok2(cls, deployment: "Deployment", token_name: str) -> str:
    query = cls.query.join(DeploymentPermission).having(
        cls == hello
    )

# ok: sqlalchemy-having-sql-injection
def ok3(var):
    query = cls.query.having(
        "oops{}".format(var=3)
    )

# ok: sqlalchemy-having-sql-injection
def ok4(var):
    query = query.having(desc(Scan.started_at)).limit(limit)

