# cf. https://github.com/python-security/pyt//blob/093a077bcf12d1f58ddeb2d73ddc096623985fb0/examples/vulnerable_code/

import json
import flask
from flask import Flask, request, make_response
from somewhere import fxn
app = Flask(__name__)

@app.route('/XSS_param', methods =['GET'])
def XSS1():
    param = request.args.get('param', 'not set')

    other_var = param

    html = open('templates/XSS_param.html').read()
    # ruleid: make-response-with-unknown-content
    resp = make_response(html.replace('{{ param }}', other_var))
    return resp

# cf. https://github.com/alshapton/kb-api/commit/bd649de1da9e4020f9273fff183a74edfadc0b07

def switch(target:str, config: Dict[str, str]):
    if does_base_exist(target,config):
        switch_base(target,config)
        # ruleid: make-response-with-unknown-content
        resp = (make_response(({'Switched': "The current knowledge base is now : '" + target + "'"}), 200))
    else:
        # ruleid: make-response-with-unknown-content
        resp = (make_response(({'Error': "The knowledge base '" + target + "' does not exist"}), 404))
    resp.mimetype = MIME_TYPE['json']
    return resp

# Lots of little unit tests:
# ok: make-response-with-unknown-content
make_response("hello")

# ok: make-response-with-unknown-content
make_response()

# ok: make-response-with-unknown-content
make_response({"hello": "world"}, 200)

# ok: make-response-with-unknown-content
make_response(flask.render_template("index.html"))

# ok: make-response-with-unknown-content
make_response(flask.jsonify({"hello": "world"}))

# ok: make-response-with-unknown-content
make_response(json.dumps({"hello": "world"}))

# ok: make-response-with-unknown-content
make_response(flask.redirect(unk))

t = flask.render_template("index.html")
# ok: make-response-with-unknown-content
make_response(t)

unk = fxn()

# ruleid: make-response-with-unknown-content
make_response(unk)

# ruleid: make-response-with-unknown-content
make_response("<div>" + unk + "</div>")

# ruleid: make-response-with-unknown-content
make_response({"hello": unk})

t = flask.render_template("index.html")
html = t.replace("{{ name }}", unk)
# ruleid: make-response-with-unknown-content
make_response(html)

html = """
<div>
%s
</div>
""" % unk
# ruleid: make-response-with-unknown-content
make_response(html)

if __name__ == '__main__':
    app.run(debug=True)
