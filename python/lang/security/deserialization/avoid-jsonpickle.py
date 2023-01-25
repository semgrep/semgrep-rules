import jsonpickle
import flask

from rest_framework.decorators import api_view

from pyramid.view import view_config

from http.server import BaseHTTPRequestHandler
import urllib.parse

def run_payload(payload: str) -> None:
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode(payload)

def ok():
    # ok: avoid-jsonpickle
    obj = jsonpickle.decode('foobar')

def lambda_handler(event, context):

    tainted = event['exploit_code']
    s = "encoded-data"
    b = bytearray().extend(map(ord,string))

    # ruleid: avoid-jsonpickle
    jsonpickle.decode(tainted)
    # ok: avoid-jsonpickle
    jsonpickle.decode(s)

@app.route("/a/rout")
def insert_person():

    tainted = flask.request.get_json()
    tainted2 = flask.request.cookies("taint")
    tainted3 = flask.request.headers.get("taint")

    s = "not tainted"
    b = bytearray().extend(map(ord,string))

    # ruleid: avoid-jsonpickle
    jsonpickle.decode(tainted)
    # ok: avoid-jsonpickle
    jsonpickle.decode(s)

@api_view(['GET', 'POST'])
def view_renderer(request):

    tainted = request.get_signed_cookie('taint')
    tainted2 = request.query_params['taint']
    tainted3 = request.COOKIES.get('taint')

    s = "not tainted"
    b = bytearray().extend(map(ord,string))

    # ruleid: avoid-jsonpickle
    jsonpickle.decode(tainted)
    # ok: avoid-jsonpickle
    jsonpickle.decode(s)


@view_config(route_name='ok', request_method='POST', permission='read')
def my_view(request):

    tainted = request.make_tempfile()
    tainted2 = request.json['taint']
    tainted3 = request.params.get('taint')

    s = "not tainted"
    b = bytearray().extend(map(ord,string))

    # ruleid: avoid-jsonpickle
    jsonpickle.decode(tainted)
    # ok: avoid-jsonpickle
    jsonpickle.decode(s)


class GetHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        tainted = urlparse.urlparse(self.path).query

        # ruleid: avoid-jsonpickle
        jsonpickle.decode(tainted)
        # ok: avoid-jsonpickle
        jsonpickle.decode(s)
