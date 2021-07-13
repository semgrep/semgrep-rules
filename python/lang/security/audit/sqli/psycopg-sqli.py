import psycopg2

def bad1():
    conn = psycopg2.connect("dbname=test user=postgres")

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    # ruleid: psycopg-sqli
    cur.execute(query)

def bad2():
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    sql_query = 'SELECT * FROM {}'.format(user_input)
    # ruleid: psycopg-sqli
    cur.execute(sql_query)

def bad3():
    conn = psycopg2.connect(DSN)

    with conn:
        with conn.cursor() as cur:
            sql_query = 'SELECT * FROM %s'%(user_input)
            # ruleid: psycopg-sqli
            cur.execute(sql_query)

def bad4(user_input):
    conn = psycopg2.connect(DSN)
    with conn:
        with conn.cursor() as cur:
            sql_query = f'SELECT * FROM {user_input}'
            # ruleid: psycopg-sqli
            cur.execute(sql_query)

def bad5():
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.executemany("SELECT name FROM users WHERE age=" + req.FormValue("age"))

def bad6(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM {}'.format(user_input))

def bad7(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute('SELECT * FROM %s'%(user_input))

def bad8(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute(f'SELECT * FROM {user_input}')

def bad9():
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ruleid: psycopg-sqli
    cur.execute(
    "insert into %s values (%%s, %%s)" % ext.quote_ident(table_name),[10, 20])

def ok1(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    SQL = "INSERT INTO authors (name) VALUES (%s);"
    # ok: psycopg-sqli
    cur.execute(SQL, user_input)

def ok2(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = "SELECT name FROM users WHERE age=" + "3"
    # ok: psycopg-sqli
    cur.execute(query)

def ok3(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = "SELECT name FROM users WHERE age="
    query += "3"
    # ok: psycopg-sqli
    cur.execute(query)

def ok4(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = 'SELECT * FROM John'.format()
    # ok: psycopg-sqli
    cur.execute(query)

def ok5(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = 'SELECT * FROM John'% ()
    # ok: psycopg-sqli
    cur.execute(query)

def ok6(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = f'SELECT * FROM John'
    # ok: psycopg-sqli
    cur.execute(query)

def ok7(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute("SELECT name FROM users WHERE age=" + "3")

def ok8(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM John'.format())

def ok9(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute('SELECT * FROM John'% ())

def ok10(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    # ok: psycopg-sqli
    cur.execute(f'SELECT * FROM John')

def ok11(user_input):
    conn = psycopg2.connect("dbname=test user=postgres")
    cur = conn.cursor()
    query = sql.SQL("select {field} from {table} where {pkey} = %s").format(
    field=sql.Identifier('my_name'),
    table=sql.Identifier('some_table'),
    pkey=sql.Identifier('id'))
    # ok: psycopg-sqli
    cur.execute(query)
