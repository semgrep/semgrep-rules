import os
import flask
app = flask.Flask(__name__)

# ruleid: avoid_hardcoded_config_TESTING
app.config["TESTING"] = True
# ruleid: avoid_hardcoded_config_TESTING
app.config["TESTING"] = False
# ruleid: avoid_hardcoded_config_TESTING
app.config.update(TESTING=True)

# ruleid: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY="aaaa")
# ruleid: avoid_hardcoded_config_SECRET_KEY
app.config["SECRET_KEY"] = '_5#y2L"F4Q8z\n\xec]/'

# ruleid: avoid_hardcoded_config_ENV
app.config["ENV"] = "development"
# ruleid: avoid_hardcoded_config_ENV
app.config["ENV"] = "production"

# ruleid: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = True
# ruleid: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = False

# ok: avoid_hardcoded_config_TESTING
app.config["TESTING"] = os.getenv("TESTING")
# ok: avoid_hardcoded_config_TESTING
app.config["TESTING"] = "aa"

# ok: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY=os.getenv("SECRET_KEY"))
# ok: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY=os.environ["SECRET_KEY"])

# ok: avoid_hardcoded_config_ENV
app.config["ENV"] = os.environ["development"]

# ok: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = os.environ["DEBUG"] or True
# ok: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = os.environ["DEBUG"] or False
