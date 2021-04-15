import asyncio
import asyncpg

def bad1():
    conn = await asyncpg.connect(user='user', password='password',
                                 database='database', host='127.0.0.1')

    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    # ruleid: asyncpg-sqli
    values = await conn.fetch(query)
    await conn.close()

async def bad2(conn: Connection):
    async with conn.transaction():
        sql_query = 'SELECT * FROM {}'.format(user_input)
        # ruleid: asyncpg-sqli
        cur = await conn.cursor(sql_query)

def bad3(connection: Connection):
    async with connection.transaction():
        sql_query = 'SELECT * FROM %s'%(user_input)
        # ruleid: asyncpg-sqli
        await connection.execute(sql_query)

def bad4(user_input):
    async with asyncpg.create_pool(user='postgres',
                                   command_timeout=60) as pool:
        sql_query = f'SELECT * FROM {user_input}'
        # ruleid: asyncpg-sqli
        await pool.fetch(sql_query)

def bad5():
    async with asyncpg.create_pool(user='postgres',
                                   command_timeout=60) as pool:
        async with pool.acquire() as con:
            # ruleid: asyncpg-sqli
            await con.execute("SELECT name FROM users WHERE age=" + req.FormValue("age"))

def bad6(user_input):
    pool = await asyncpg.create_pool(user='postgres', command_timeout=60)
    con = await pool.acquire()
    try:
        # ruleid: asyncpg-sqli
        await con.execute('SELECT * FROM {}'.format(user_input))
    finally:
        await pool.release(con)

async def bad7(conn: Connection, user_input):
    # ruleid: asyncpg-sqli
    conn.execute('SELECT * FROM %s'%(user_input))

async def bad8(conn: Connection, user_input):
    # ruleid: asyncpg-sqli
    conn.fetchrow(f'SELECT * FROM {user_input}')

async def bad9(conn: Connection, user_input):
    # ruleid: asyncpg-sqli
    conn.execute(
    "insert into %s values (%%s, %%s)" % ext.quote_ident(table_name),[10, 20])

def ok1(user_input):
    con = await asyncpg.connect(user='postgres')
    # ok: asyncpg-sqli
    result = await con.copy_from_query(
         'SELECT foo, bar FROM mytable WHERE foo > $1', 10,
         output='file.csv', format='csv')
    print(result)

def ok2(user_input):
    con = await asyncpg.connect(user='postgres')
    query = "SELECT name FROM users WHERE age=" + "3"
    # ok: asyncpg-sqli
    con.execute(query)

def ok3(con: Connection, user_input):
    query = "SELECT name FROM users WHERE age="
    query += "3"
    # ok: asyncpg-sqli
    con.execute(query)

def ok4(user_input):
    con = await asyncpg.connect(user='postgres')
    query = 'SELECT * FROM John'.format()
    # ok: asyncpg-sqli
    con.fetchval(query)

def ok5(user_input):
    con = await asyncpg.connect(user='postgres')
    query = 'SELECT * FROM John'% ()
    # ok: asyncpg-sqli
    con.execute(query)

def ok6(con: Connection, user_input):
    query = f'SELECT * FROM John'
    # ok: asyncpg-sqli
    con.execute(query)

def ok7(con: Connection, user_input):
    # ok: asyncpg-sqli
    con.execute("SELECT name FROM users WHERE age=" + "3")

def ok8(user_input):
    con = await asyncpg.connect(user='postgres')
    # ok: asyncpg-sqli
    con.execute('SELECT * FROM John'.format())

def ok9(user_input):
    con = await asyncpg.connect(user='postgres')
    # ok: asyncpg-sqli
    con.execute('SELECT * FROM John'% ())

def ok10(user_input):
    con = await asyncpg.connect(user='postgres')
    # ok: asyncpg-sqli
    con.execute(f'SELECT * FROM John')

def ok11(user_input):
    con = await asyncpg.connect(user='postgres')
    # ok: asyncpg-sqli
    stmt = await con.prepare('SELECT ($1::int, $2::text)')
    print(stmt.get_parameters())
