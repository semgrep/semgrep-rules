import flask

app = flask.Flask()

app.config.update(
    SESSION_COOKIE_SECURE=True,
    SESSION_COOKIE_HTTPONLY=True
)

if __name__ == "__main__":
    app.run()
