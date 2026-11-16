import html
import json
import sqlite3

from aiohttp import web
from markupsafe import escape

db = sqlite3.connect("app.db")


async def greet(request):
    name = request.query.get("name", "")
    # ruleid: tainted-html-response
    return web.Response(text=f"<h1>Hello {name}</h1>", content_type="text/html")


async def profile(request):
    username = request.match_info["username"]
    page = "<html><body><h1>" + username + "</h1></body></html>"
    # ruleid: tainted-html-response
    return web.Response(text=page, content_type="text/html; charset=utf-8")


async def echo(request):
    data = await request.json()
    # ruleid: tainted-html-response
    return web.Response(body="<p>%s</p>" % data["comment"], content_type="text/html")


async def list_messages(request):
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    page = "<ul>"
    for username, content in cursor.fetchall():
        page += f"<li><b>{username}</b>: {content}</li>"
    page += "</ul>"
    # ruleid: tainted-html-response
    return web.Response(text=page, content_type="text/html")


async def show_recipe(request):
    cursor = db.cursor()
    cursor.execute("SELECT title, ingredients FROM recipes WHERE id = ?", (request.match_info["id"],))
    recipe = cursor.fetchone()
    # json.dumps does not escape "<", so it is not a sanitizer
    page = "<h2>{}</h2><p>{}</p>".format(recipe[0], json.dumps(json.loads(recipe[1])))
    # ruleid: tainted-html-response
    return web.Response(text=page, content_type="text/html")


async def stored_page(request):
    cursor = db.cursor()
    cursor.execute("SELECT profile_page FROM profiles WHERE username = ?", (request.match_info["username"],))
    result = cursor.fetchone()
    # ruleid: tainted-html-response
    return web.Response(text=result[0], content_type="text/html")


async def greet_escaped(request):
    name = request.query.get("name", "")
    # ok: tainted-html-response
    return web.Response(text=f"<h1>Hello {html.escape(name)}</h1>", content_type="text/html")


async def list_messages_escaped(request):
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    page = "<ul>"
    for username, content in cursor.fetchall():
        page += f"<li><b>{escape(username)}</b>: {escape(content)}</li>"
    page += "</ul>"
    # ok: tainted-html-response
    return web.Response(text=page, content_type="text/html")


async def count(request):
    limit = int(request.query.get("limit", 10))
    # ok: tainted-html-response
    return web.Response(text=f"<p>Showing {limit} items</p>", content_type="text/html")


async def greet_plain_text(request):
    name = request.query.get("name", "")
    # ok: tainted-html-response
    return web.Response(text=f"Hello {name}", content_type="text/plain")


async def list_messages_json(request):
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    rows = cursor.fetchall()
    # ok: tainted-html-response
    return web.json_response([{"username": u, "content": c} for u, c in rows])


async def static_page(request):
    # ok: tainted-html-response
    return web.Response(text="<h1>Welcome</h1>", content_type="text/html")
