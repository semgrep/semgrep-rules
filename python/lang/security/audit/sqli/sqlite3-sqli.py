import sqlite3

conn = sqlite3.connect("example.db")
cur = conn.cursor()

user_id = input("Enter ID: ")
name = input("Enter name: ")

# ruleid: sqlite3-sqli
cur.execute("SELECT * FROM users WHERE id = " + user_id)

# ruleid: sqlite3-sqli
cur.execute("SELECT * FROM users WHERE name = '%s'" % name)

# ruleid: sqlite3-sqli
cur.execute(f"SELECT * FROM users WHERE name = '{name}'")

# ruleid: sqlite3-sqli
cur.execute("SELECT * FROM users WHERE name = '{}'".format(name))

# ok: sqlite3-sqli
cur.execute("SELECT * FROM users WHERE id = ?", (user_id,))

# ok: sqlite3-sqli
cur.execute("SELECT * FROM users WHERE name = ?", (name,))
