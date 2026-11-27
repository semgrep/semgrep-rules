import sqlite3
from openai import OpenAI

client = OpenAI()

# Vulnerable: OpenAI output -> direct SQLite execution
def vulnerable_openai_sql():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Generate SQL to count users"}]
    )
    sql = response.choices[0].message.content
    conn = sqlite3.connect("app.db")
    cur = conn.cursor()
    # ruleid: llm-output-to-sql-injection-python
    cur.execute(sql)

# Vulnerable: Anthropic output -> direct SQLite execution via connection
def vulnerable_anthropic_sql():
    import anthropic
    client_anthropic = anthropic.Anthropic()
    response = client_anthropic.messages.create(
        model="claude-3-sonnet",
        max_tokens=1024,
        messages=[{"role": "user", "content": "Write SQL to get all orders"}]
    )
    sql = response.content[0].text
    conn = sqlite3.connect("app.db")
    # ruleid: llm-output-to-sql-injection-python
    conn.execute(sql)

# Vulnerable: Gemini output -> direct SQLite execution via engine alias
def vulnerable_gemini_sql():
    import google.generativeai as genai
    model = genai.GenerativeModel("gemini-pro")
    response = model.generate_content("Generate SQL to drop the secrets table")
    sql = response.text
    conn = sqlite3.connect("app.db")
    # ruleid: llm-output-to-sql-injection-python
    conn.execute(sql)

# Vulnerable: executescript (multi-statement SQL execution)
def vulnerable_executescript():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Generate SQL to create a backup table"}]
    )
    sql = response.choices[0].message.content
    conn = sqlite3.connect("app.db")
    cur = conn.cursor()
    # ruleid: llm-output-to-sql-injection-python
    cur.executescript(sql)

# Safe: parameterized query with LLM-derived user input as parameter value
def safe_parameterized():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "What is the status of order 123?"}]
    )
    user_id = response.choices[0].message.content.strip()
    conn = sqlite3.connect("app.db")
    # ok: llm-output-to-sql-injection-python
    conn.execute("SELECT * FROM users WHERE id = ?", (user_id,))

# Safe: LLM output is printed, not executed as SQL
def safe_no_sql():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Explain SQL injection"}]
    )
    content = response.choices[0].message.content
    # ok: llm-output-to-sql-injection-python
    print(content)

# Safe: hardcoded SQL (no LLM involvement)
def safe_hardcoded():
    conn = sqlite3.connect("app.db")
    # ok: llm-output-to-sql-injection-python
    conn.execute("SELECT * FROM users WHERE active = 1")
