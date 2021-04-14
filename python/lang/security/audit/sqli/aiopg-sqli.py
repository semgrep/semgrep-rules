import asyncio
import asyncpg

def bad1():
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = "SELECT name FROM users WHERE age=" + req.FormValue("age")
    # ruleid: aiopg-sqli
    await cur.execute(query)

async def bad2():
    pool = await aiopg.create_pool(dsn)

    with (await pool.cursor()) as cur:
        sql_query = 'SELECT * FROM {}'.format(user_input)
        # ruleid: aiopg-sqli
        await cur.execute(sql_query)
        ret = await cur.fetchone()
        assert ret == (1,), ret

async def bad3():
    pool = await aiopg.create_pool(dsn)
    async with pool.acquire() as conn:
        sql_query = 'SELECT * FROM %s'%(user_input)
        async with conn.cursor() as cur:
            # ruleid: aiopg-sqli
            await cur.execute(sql_query)
            ret = []
            async for row in cur:
                ret.append(row)

def bad4(user_input):
    pool = await aiopg.create_pool(dsn)
    async with pool as conn:
        cur = await conn.cursor()
        sql_query = f'SELECT * FROM {user_input}'
        # ruleid: aiopg-sqli
        await cur.execute(sql_query)

def bad5():
    pool = await aiopg.create_pool(dsn)
    async with pool.cursor() as cur:
        # ruleid: aiopg-sqli
        await cur.execute("SELECT name FROM users WHERE age=" + req.FormValue("age"))

def bad6(user_input):
    pool = await aiopg.create_pool(dsn)
    async with pool.cursor() as cur:
        # ruleid: aiopg-sqli
        await cur.execute('SELECT * FROM {}'.format(user_input))

async def bad7(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ruleid: aiopg-sqli
    cur.execute('SELECT * FROM %s'%(user_input))

async def bad8(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ruleid: aiopg-sqli
    cur.execute(f'SELECT * FROM {user_input}')

async def bad9(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ruleid: aiopg-sqli
    cur.execute(
    "insert into %s values (%%s, %%s)" % ext.quote_ident(table_name),[10, 20])

def ok1(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ok: aiopg-sqli
    cur.execute("SELECT * FROM test WHERE id = %s", (3,))

def ok2(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = "SELECT name FROM users WHERE age=" + "3"
    # ok: aiopg-sqli
    cur.execute(query)

def ok3(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = "SELECT name FROM users WHERE age="
    query += "3"
    # ok: aiopg-sqli
    cur.execute(query)

def ok4(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = 'SELECT * FROM John'.format()
    # ok: aiopg-sqli
    cur.fetchval(query)

def ok5(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = 'SELECT * FROM John'% ()
    # ok: aiopg-sqli
    cur.execute(query)

def ok6(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    query = f'SELECT * FROM John'
    # ok: aiopg-sqli
    cur.execute(query)

def ok7(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ok: aiopg-sqli
    cur.execute("SELECT name FROM users WHERE age=" + "3")

def ok8(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ok: aiopg-sqli
    cur.execute('SELECT * FROM John'.format())

def ok9(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ok: aiopg-sqli
    cur.execute('SELECT * FROM John'% ())

def ok10(user_input):
    conn = await aiopg.connect(database='aiopg',
                               user='aiopg',
                               password='secret',
                               host='127.0.0.1')
    cur = await conn.cursor()
    # ok: aiopg-sqli
    cur.execute(f'SELECT * FROM John')
