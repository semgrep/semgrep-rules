import html
import sqlite3

from fastapi import FastAPI, Request, Response
from fastapi.responses import HTMLResponse, JSONResponse
from markupsafe import escape

app = FastAPI()
db = sqlite3.connect("app.db")


@app.get("/greet")
def greet(name: str):
    # ruleid: tainted-html-response
    return HTMLResponse(f"<h1>Hello {name}</h1>")


@app.get("/users/{username}")
async def profile(username: str):
    page = "<html><body><h1>" + username + "</h1></body></html>"
    # ruleid: tainted-html-response
    return HTMLResponse(content=page)


@app.post("/echo")
async def echo(request: Request):
    data = await request.json()
    # ruleid: tainted-html-response
    return Response(content="<p>%s</p>" % data["comment"], media_type="text/html")


@app.get("/messages", response_class=HTMLResponse)
def list_messages():
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    page = "<ul>"
    for username, content in cursor.fetchall():
        page += f"<li><b>{username}</b>: {content}</li>"
    page += "</ul>"
    # ruleid: tainted-html-response
    return page


@app.get("/recipes/{recipe_id}")
def show_recipe(recipe_id: str):
    cursor = db.cursor()
    cursor.execute("SELECT title, instructions FROM recipes WHERE id = ?", (recipe_id,))
    recipe = cursor.fetchone()
    # ruleid: tainted-html-response
    return HTMLResponse(content="<h2>{}</h2><p>{}</p>".format(recipe[0], recipe[1]))


@app.get("/greet-escaped")
def greet_escaped(name: str):
    # ok: tainted-html-response
    return HTMLResponse(f"<h1>Hello {html.escape(name)}</h1>")


@app.get("/messages-escaped", response_class=HTMLResponse)
def list_messages_escaped():
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    page = "<ul>"
    for username, content in cursor.fetchall():
        page += f"<li><b>{escape(username)}</b>: {escape(content)}</li>"
    page += "</ul>"
    # ok: tainted-html-response
    return page


@app.get("/count")
def count(limit: int = 10):
    # ok: tainted-html-response
    return HTMLResponse(f"<p>Showing {int(limit)} items</p>")


@app.get("/greet-text")
def greet_plain_text(name: str):
    # ok: tainted-html-response
    return Response(content=f"Hello {name}", media_type="text/plain")


@app.get("/messages-json")
def list_messages_json():
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    rows = cursor.fetchall()
    # ok: tainted-html-response
    return JSONResponse([{"username": u, "content": c} for u, c in rows])


@app.get("/messages-default")
def list_messages_default():
    cursor = db.cursor()
    cursor.execute("SELECT username, content FROM messages")
    # ok: tainted-html-response
    return [{"username": u, "content": c} for u, c in cursor.fetchall()]


@app.get("/", response_class=HTMLResponse)
def index():
    # ok: tainted-html-response
    return "<h1>Welcome</h1>"
