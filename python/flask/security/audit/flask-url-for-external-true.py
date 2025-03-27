# ruleid: flask-url-for-external-true
flask.url_for("vuln", _external=True)
# ruleid: flask-url-for-external-true
flask.url_for("vuln", _external=variable)

# ruleid: flask-url-for-external-true
url_for("vuln", _external=True)
# ruleid: flask-url-for-external-true
url_for("vuln", _external=variable)

# ok: flask-url-for-external-true
flask.url_for("no.vuln")
# ok: flask-url-for-external-true
flask.url_for("no.vuln", _external=False)

# ok: flask-url-for-external-true
url_for("no.vuln")
# ok: flask-url-for-external-true
url_for("no.vuln", _external=False)
