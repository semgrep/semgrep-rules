import flask

# ok
app = flask.Flask()

app.config.update(
    SESSION_COOKIE_SECURE=True,
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
)

if __name__ == "__main__":
    app.run()
