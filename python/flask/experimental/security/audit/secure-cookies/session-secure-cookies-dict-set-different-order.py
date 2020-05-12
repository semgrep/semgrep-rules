import flask

# ok
app = flask.Flask()

app.config["SESSION_COOKIE_HTTPONLY"] = True
print("statement")
app.config["SESSION_COOKIE_SAMESITE"] = "Strict"
app.config["SESSION_COOKIE_SECURE"] = True

if __name__ == "__main__":
    app.run()
