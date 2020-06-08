import flask

app = flask.Flask(__name__)

@app.route("/error")
def error(e):
    template = '''{  extends "layout.html"  }
{  block body  }
    <div class="center-content error">
        <h1>Oops! That page doesn't exist.</h1>
        <h3>%s</h3>
    </div>
{  endblock  }
'''.format(request.url)
    return flask.render_template_string(template), 404

