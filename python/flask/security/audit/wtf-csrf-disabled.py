import flask
from flask import response as r

app = flask.Flask(__name__)
# ruleid:flask-wtf-csrf-disabled
app.config['WTF_CSRF_ENABLED'] = False

# ruleid:flask-wtf-csrf-disabled
app.config["WTF_CSRF_ENABLED"] = False

# ok: flask-wtf-csrf-disabled
app.config["WTF_CSRF_ENABLED"] = True
# ok: flask-wtf-csrf-disabled
app.config["SESSION_COOKIE_SECURE"] = False

# ruleid: flask-wtf-csrf-disabled
app.config.WTF_CSRF_ENABLED = False
# ok: flask-wtf-csrf-disabled
app.config.WTF_CSRF_ENABLED = True

# DICT UPDATE
################

app.config.update(
    SECRET_KEY='192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf',
    # ruleid: flask-wtf-csrf-disabled
    WTF_CSRF_ENABLED = False,
    TESTING=False
)

# It's okay to do this during testing
app.config.update(
    SECRET_KEY='192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf',
    # ok: flask-wtf-csrf-disabled
    WTF_CSRF_ENABLED = False,
    TESTING=True
)

# FROM OBJECT
################

# custom class
appconfig = MyAppConfig()
# ruleid: flask-wtf-csrf-disabled
appconfig.WTF_CSRF_ENABLED = False

app.config.from_object(appconfig)

# this file itself
SECRET_KEY = 'development key'
# ruleid: flask-wtf-csrf-disabled
WTF_CSRF_ENABLED = False

app.config.from_object(__name__)

# FROM MAPPING
################

app.config.from_mapping(
    SECRET_KEY='192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf',
    # ruleid: flask-wtf-csrf-disabled
    WTF_CSRF_ENABLED = False,
)

# It's okay to do this during testing
app.config.from_mapping(
    SECRET_KEY='192b9bdd22ab9ed4d12e236c78afcb9a393ec15f71bbf5dc987d54727823bcbf',
    # ok: flask-wtf-csrf-disabled
    WTF_CSRF_ENABLED = False,
    TESTING=True
)

@app.route("/index")
def index():
    return 'hello world'
