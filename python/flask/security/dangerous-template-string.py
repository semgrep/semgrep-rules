import flask

app = flask.Flask(__name__)

@app.route("/error")
def error(e):
    # ruleid: dangerous-template-string
    template = '''{  extends "layout.html"  }
{  block body  }
    <div class="center-content error">
        <h1>Oops! That page doesn't exist.</h1>
        <h3>%s</h3>
    </div>
{  endblock  }
'''.format(request.url)
    return flask.render_template_string(template), 404

@app.route("/error2")
def error2(e):
    # ruleid: dangerous-template-string
    template = '''{  extends "layout.html"  }
{  block body  }
    <div class="center-content error">
        <h1>Oops! That page doesn't exist.</h1>
        <h3>%s</h3>
    </div>
{  endblock  }
''' % (request.url)
    return flask.render_template_string(template), 404

@app.route("/error3")
def error3(e):
    # ruleid: dangerous-template-string
    template = f'''{{  extends "layout.html"  }}
{{  block body  }}
    <div class="center-content error">
        <h1>Oops! That page doesn't exist.</h1>
        <h3>{request.url}</h3>
    </div>
{{  endblock  }}
'''
    return flask.render_template_string(template)

@app.route("/error4")
def error4(e):
    # ruleid: dangerous-template-string
    template = """
{  extends "layout.html"  }
{  block body  }
    <div class="center-content error">
        <h1>Oops! That page doesn't exist.</h1>
        <h3>
"""
    template += request.url
    template += """
</h3>
</div>
{  endblock  }
"""
    rendered = flask.render_template_string(template)

@app.route("/inline_fstring")
def inline_fstring():
    # ruleid: dangerous-template-string
    return flask.render_template_string(f"<h1>{request.url}</h1>")

@app.route("/inline_fstring_tuple")
def inline_fstring_tuple():
    # ruleid: dangerous-template-string
    return flask.render_template_string(f"<h1>{request.url}</h1>"), 404

@app.route("/inline_format")
def inline_format():
    # ruleid: dangerous-template-string
    return flask.render_template_string("<h1>{}</h1>".format(request.url))

@app.route("/inline_percent")
def inline_percent():
    # ruleid: dangerous-template-string
    return flask.render_template_string("<h1>%s</h1>" % request.url)

@app.route("/inline_concat")
def inline_concat():
    # ruleid: dangerous-template-string
    return flask.render_template_string("<h1>" + request.url + "</h1>")

@app.route("/safe_context")
def safe_context():
    # ok: dangerous-template-string
    return flask.render_template_string("<h1>{{ url }}</h1>", url=request.url)

@app.route("/safe_constant")
def safe_constant():
    # ok: dangerous-template-string
    return flask.render_template_string("<h1>static</h1>")
