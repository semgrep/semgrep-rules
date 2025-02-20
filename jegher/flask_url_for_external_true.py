# True positive cases

## case when user simply imports flask
flask.url_for("vuln", _external=True)
flask.url_for("vuln", _external=variable)

## case when user imports url_for from flask
url_for("vuln", _external=True)
url_for("vuln", _external=variable)

# True negative cases

# case when user simply imports flask
flask.url_for("no.vuln")
flask.url_for("no.vuln", _external=False)

## case when user imports url_for from flask
url_for("no.vuln")
url_for("no.vuln", _external=False)
