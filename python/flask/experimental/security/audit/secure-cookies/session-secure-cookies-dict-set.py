import flask

# ok
app = flask.Flask()

app.config["SESSION_COOKIE_SECURE"]=True
app.config["SESSION_COOKIE_HTTPONLY"]=True
app.config["SESSION_COOKIE_SAMESITE"]='Lax'

if __name__ == "__main__":
    app.run()
