import flask

# ruleid: secure-session-cookies
app = flask.Flask()

app.config["SESSION_COOKIE_SECURE"]=True
app.config["SESSION_COOKIE_HTTPONLY"]=True

if __name__ == "__main__":
    app.run()
