##########################################################################
# Connectionless query
##########################################################################

# String concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
echo("database connexion: ok")
# ruleid: sqlalchemy-execute-raw-query
engine.execute("INSERT INTO person (name) VALUES ('" + name + "')")

# String concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
engine.execute("INSERT INTO person (firstname, lastname) VALUES ('" + firstname + "','" + lastname + "')")

# String formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
engine.execute("INSERT INTO person (name) VALUES ('%s')" % (name))

# String formating (new style)
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
engine.execute("INSERT INTO person (name) VALUES ('{}')".format(name))

# String concatenation using fstrings
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
engine.execute(f"INSERT INTO person (name) VALUES ('{name}')")

# String concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
query = "INSERT INTO person (name) VALUES ('" + name + "')"
engine.execute(query)

# String formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
query = "INSERT INTO person (name) VALUES ('%s')" % (name)
engine.execute(query)

# String formating (new style)
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
query = "INSERT INTO person (name) VALUES ('{}')".format(name)
engine.execute(query)

# String formating using fstrings
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
query = f"INSERT INTO person (name) VALUES ('{name}')"
engine.execute(query)

# fstrings
engine = create_engine('postgresql://user@localhost/database')
# ruleid: sqlalchemy-execute-raw-query
query: str = f"INSERT INTO person (name) VALUES ('{name}')"
engine.execute(query)

# Query without concatenation
# ok: sqlalchemy-execute-raw-query
engine = create_engine('postgresql://user@localhost/database')
engine.execute("INSERT INTO person (name) VALUES ('Frodon Sacquet')")

##########################################################################
# Execute query without "With" block
##########################################################################

# Execute query from string concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
connection = engine.connect()
# ruleid: sqlalchemy-execute-raw-query
connection.execute("INSERT INTO person (name) VALUES ('" + name + "')")

# Execute query from String formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
connection = engine.connect()
# ruleid: sqlalchemy-execute-raw-query
connection.execute("INSERT INTO person (name) VALUES ('%s')" % (name))

# Execute query from string formating (new style)
engine = create_engine('postgresql://user@localhost/database')
connection = engine.connect()
# ruleid: sqlalchemy-execute-raw-query
connection.execute("INSERT INTO person (name) VALUES ('{}')".format(name))

# Execute query from string concatenation fstrings
engine = create_engine('postgresql://user@localhost/database')
connection = engine.connect()
# ruleid: sqlalchemy-execute-raw-query
connection.execute(f"INSERT INTO person (name) VALUES ('{name}')")

##########################################################################
# Execute query in With block
##########################################################################

# Execute query in With block from String concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    connection.execute("INSERT INTO person (name) VALUES ('" + name + "')")

# Execute query in With block from string formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    connection.execute("INSERT INTO person (name) VALUES ('%s')" % (name))

# Execute query in With block from String formating (new style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    connection.execute("INSERT INTO person (name) VALUES ('{}')".format(name))

# Execute query in With block from String concatenation  fstrings
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    connection.execute(f"INSERT INTO person (name) VALUES ('{name}')")

##########################################################################
# Execute query in With block and using a variable
##########################################################################

# Execute query in With block from variable set by string concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query = "INSERT INTO person (name) VALUES ('" + name + "')"
    connection.execute(query)

# Execute query in With block from variable (type) set by String concatenation using + operator
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query: str = "INSERT INTO person (name) VALUES ('" + name + "')"
    connection.execute(query)


# Execute query in With block from variable set by String formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query = "INSERT INTO person (name) VALUES ('%s')" % (name)
    connection.execute(query)

# Execute query in With block from variable (type) set by String formating using % operator (old style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query: str = "INSERT INTO person (name) VALUES ('%s')" % (name)
    connection.execute(query)

# Execute query in With block from variable set by String formating (new style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query = "INSERT INTO person (name) VALUES ('{}')".format(name)
    connection.execute(query)

# Execute query in With block from variable (typed) set by String formating (new style)
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query: str = "INSERT INTO person (name) VALUES ('{}')".format(name)
    connection.execute(query)

# Execute query in With block from variable set by String concatenation  fstrings
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query = f"INSERT INTO person (name) VALUES ('{name}')"
    connection.execute(query)

# Execute query in With block from variable (typed) set by String concatenation  fstrings
engine = create_engine('postgresql://user@localhost/database')
with engine.connect() as connection:
    # ruleid: sqlalchemy-execute-raw-query
    query: str = f"INSERT INTO person (name) VALUES ('{name}')"
    connection.execute(query)

########################################################################

# Query using prepared statement with named parameters
# ok: sqlalchemy-execute-raw-query
engine = create_engine('postgresql://user@localhost/database')
stmt = text("INSERT INTO table (name) VALUES(:name)")
connection.execute(stmt, name='Frodon Sacquet')

# SQL Composition and prepared statement
# ok: sqlalchemy-execute-raw-query
engine = create_engine('postgresql://user@localhost/database')
query = select(literal_column("users.fullname", String) + ', ' + literal_column("addresses.email_address").label("title")).where(and_(literal_column("users.id") == literal_column("addresses.user_id"), text("users.name BETWEEN 'm' AND 'z'"), text("(addresses.email_address LIKE :x OR addresses.email_address LIKE :y)"))).select_from(table('users')).select_from(table('addresses'))
conn.execute(query, {"x":"%@aol.com", "y":"%@msn.com"}).fetchall()
