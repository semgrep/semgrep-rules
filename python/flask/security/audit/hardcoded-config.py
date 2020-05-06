import os
import flask
app = flask.Flask(__name__)
# SHOULD MATCH

# For `TESTING`
# ruleid: hardcoded-config
app.config["TESTING"] = True
# ruleid: hardcoded-config
app.config["TESTING"] = False
# ruleid: hardcoded-config
app.config.update(TESTING=True)

# For `SECRET_KEY`
# ruleid: hardcoded-config
app.config.update(SECRET_KEY="aaaa")
# ruleid: hardcoded-config
app.config["SECRET_KEY"] = b'_5#y2L"F4Q8z\n\xec]/'

# For `ENV`
# ruleid: hardcoded-config
app.config["ENV"] = "development"
# ruleid: hardcoded-config
app.config["ENV"] = "production"

# For `DEBUG`
# ruleid: hardcoded-config
app.config["DEBUG"] = True
# ruleid: hardcoded-config
app.config["DEBUG"] = False

# SHOULD NOT MATCH
# For `TESTING`
app.config["TESTING"] = os.getenv("TESTING")
app.config["TESTING"] = "aa"

# For `SECRET_KEY`
app.config.update(SECRET_KEY=os.getenv("SECRET_KEY"))
app.config.update(SECRET_KEY=os.environ["SECRET_KEY"])

# FOR `ENV`
app.config["ENV"] = os.environ["development"]

# For `DEBUG`
app.config["DEBUG"] = os.environ["DEBUG"] or True
app.config["DEBUG"] = os.environ["DEBUG"] or False