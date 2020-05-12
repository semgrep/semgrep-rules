import flask

# ruleid: secure-session-cookies
app = flask.Flask()

app.config["SESSION_COOKIE_SAMESITE"]="Lax"
print("blah")
app.config["SESSION_COOKIE_SECURE"]=True

if __name__ == "__main__":
    app.run()
