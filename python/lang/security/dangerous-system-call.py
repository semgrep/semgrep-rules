import os

# ok:dangerous-system-call
os.system("ls -al")

# ok:dangerous-system-call
os.popen("cat contents.txt")

from somewhere import something

# fn:dangerous-system-call
os.system(something())

# fn:dangerous-system-call
os.popen(something())

# fn:dangerous-system-call
os.popen2(something())


# Flask true positives
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-system-call
    os.system("prefix" + route_param + "suffix")
    # ruleid:dangerous-system-call
    os.popen("prefix" + route_param + "suffix")
    # ruleid:dangerous-system-call
    os.popen2("prefix" + route_param + "suffix")
    # ruleid:dangerous-system-call
    getattr(os, "system")("prefix" + route_param + "suffix")


    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-system-call
    os.system("static")
    # ok:dangerous-system-call
    os.popen("static")
    # ok:dangerous-system-call
    os.popen2("static")

    return "ok!"


# Django true positives
from django.http import HttpResponse


def get_user_age1(request):
    user_data = request.POST.get("user_data")

    # ruleid:dangerous-system-call
    os.system("prefix" + user_data + "suffix")
    # ruleid:dangerous-system-call
    os.popen("prefix" + user_data + "suffix")
    # ruleid:dangerous-system-call
    os.popen2("prefix" + user_data + "suffix")

    return HttpResponse("oops!")


# Django true negatives
def get_user_age2(request):

    # ok:dangerous-system-call
    os.system("static")
    # ok:dangerous-system-call
    os.popen("static")
    # ok:dangerous-system-call
    os.popen2("static")

    return HttpResponse("ok!")


# Django Rest true positives
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(["GET", "POST"])
def my_api(req):
    user_data = req.POST.get("user_data")

    # ruleid:dangerous-system-call
    os.system("prefix" + user_data + "suffix")
    # ruleid:dangerous-system-call
    os.popen("prefix" + user_data + "suffix")
    # ruleid:dangerous-system-call
    os.popen2("prefix" + user_data + "suffix")

    return Response()


from django.http import Http404
from rest_framework.views import APIView
from rest_framework import status


class MyApi(APIView):
    def get(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()

    def post(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()


from rest_framework import mixins
from rest_framework import generics


class MyApi2(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
    def get(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()

    def post(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()


# Pyramid true positives
from pyramid.view import view_config
from pyramid.request import Response


@view_config(
    route_name="bad_route", renderer="pyramid_test_mako:templates/mytemplate.mako"
)
def my_bad_view1(request):
    param = request.params.get("p", "")

    # ruleid:dangerous-system-call
    os.system("prefix" + param + "suffix")
    # ruleid:dangerous-system-call
    os.popen("prefix" + param + "suffix")
    # ruleid:dangerous-system-call
    os.popen2("prefix" + param + "suffix")

    return Response("oops!")


@view_config(
    route_name="good_route", renderer="pyramid_test_mako:templates/mytemplate.mako"
)
def my_good_view1(request):

    # ok:dangerous-system-call
    os.system("static")
    # ok:dangerous-system-call
    os.popen("static")
    # ok:dangerous-system-call
    os.popen2("static")

    return Response("ok!")


