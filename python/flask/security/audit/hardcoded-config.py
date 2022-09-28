import os
import flask
app = flask.Flask(__name__)

# todoid: avoid_hardcoded_config_TESTING
app.config["TESTING"] = True
# todoid: avoid_hardcoded_config_TESTING
app.config["TESTING"] = False
# todoid: avoid_hardcoded_config_TESTING
app.config.update(TESTING=True)

# todoid: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY="aaaa")
# todoid: avoid_hardcoded_config_SECRET_KEY
app.config["SECRET_KEY"] = '_5#y2L"F4Q8z\n\xec]/'

# todoid: avoid_hardcoded_config_ENV
app.config["ENV"] = "development"
# todoid: avoid_hardcoded_config_ENV
app.config["ENV"] = "production"

# ruleid: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = True
# ruleid: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = False

# todook: avoid_hardcoded_config_TESTING
app.config["TESTING"] = os.getenv("TESTING")
# todook: avoid_hardcoded_config_TESTING
app.config["TESTING"] = "aa"

# todook: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY=os.getenv("SECRET_KEY"))
# todook: avoid_hardcoded_config_SECRET_KEY
app.config.update(SECRET_KEY=os.environ["SECRET_KEY"])

# todook: avoid_hardcoded_config_ENV
app.config["ENV"] = os.environ["development"]

# todook: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = os.environ["DEBUG"] or True
# todook: avoid_hardcoded_config_DEBUG
app.config["DEBUG"] = os.environ["DEBUG"] or False
