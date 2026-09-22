from openai import OpenAI
from langchain_openai import ChatOpenAI
import sqlalchemy

client = OpenAI()
llm = ChatOpenAI()


def vulnerable_fstring(cursor):
    r = client.chat.completions.create(
        model="gpt-4", messages=[{"role": "user", "content": "table name"}]
    )
    table = r.choices[0].message.content
    # ruleid: llm-output-to-sql-python
    cursor.execute(f"SELECT * FROM {table}")


def vulnerable_sqlalchemy(conn):
    r = client.chat.completions.create(
        model="gpt-4", messages=[{"role": "user", "content": "filter"}]
    )
    filt = r.choices[0].message.content
    # ruleid: llm-output-to-sql-python
    conn.execute(sqlalchemy.text("SELECT * FROM orders WHERE status = '" + filt + "'"))


def vulnerable_langchain_invoke(cursor):
    resp = llm.invoke("give me a column name")
    col = resp.content
    # ruleid: llm-output-to-sql-python
    cursor.execute(f"SELECT {col} FROM users")


def vulnerable_django_raw(User):
    r = client.chat.completions.create(
        model="gpt-4", messages=[{"role": "user", "content": "where clause"}]
    )
    clause = r.choices[0].message.content
    # ruleid: llm-output-to-sql-python
    User.objects.raw("SELECT * FROM users WHERE " + clause)


def safe_parameterized(cursor):
    r = client.chat.completions.create(
        model="gpt-4", messages=[{"role": "user", "content": "status"}]
    )
    status = r.choices[0].message.content
    # ok: llm-output-to-sql-python
    cursor.execute("SELECT * FROM orders WHERE status = %s", (status,))


def safe_hardcoded(cursor):
    # ok: llm-output-to-sql-python
    cursor.execute("SELECT * FROM users WHERE id = 1")
