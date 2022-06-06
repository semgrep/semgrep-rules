import os

# ok:dangerous-taint-system-call
os.system("ls -al")

# ok:dangerous-taint-system-call
os.popen("cat contents.txt")

from somewhere import something

# fn:dangerous-taint-system-call
os.system(something())

# fn:dangerous-taint-system-call
os.popen(something())

# fn:dangerous-taint-system-call
os.popen2(something())


# Flask true positives
import flask

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):

    # ruleid:dangerous-taint-system-call
    os.system("prefix" + route_param + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen("prefix" + route_param + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen2("prefix" + route_param + "suffix")

    return "oops!"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-taint-system-call
    os.system("static")
    # ok:dangerous-taint-system-call
    os.popen("static")
    # ok:dangerous-taint-system-call
    os.popen2("static")

    return "ok!"


# Django true positives
from django.http import HttpResponse


def get_user_age1(request):
    user_data = request.POST.get("user_data")

    # ruleid:dangerous-taint-system-call
    os.system("prefix" + user_data + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen("prefix" + user_data + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen2("prefix" + user_data + "suffix")

    return HttpResponse("oops!")


# Django true negatives
def get_user_age2(request):

    # ok:dangerous-taint-system-call
    os.system("static")
    # ok:dangerous-taint-system-call
    os.popen("static")
    # ok:dangerous-taint-system-call
    os.popen2("static")

    return HttpResponse("ok!")


# Django Rest true positives
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(["GET", "POST"])
def my_api(req):
    user_data = req.POST.get("user_data")

    # ruleid:dangerous-taint-system-call
    os.system("prefix" + user_data + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen("prefix" + user_data + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen2("prefix" + user_data + "suffix")

    return Response()


from django.http import Http404
from rest_framework.views import APIView
from rest_framework import status


class MyApi(APIView):
    def get(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-taint-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()

    def post(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-taint-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()


from rest_framework import mixins
from rest_framework import generics


class MyApi2(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
    def get(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-taint-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen2("prefix" + user_data + "suffix")

        return Response()

    def post(self, req, format=None):
        user_data = req.POST.get("user_data")

        # ruleid:dangerous-taint-system-call
        os.system("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
        os.popen("prefix" + user_data + "suffix")
        # ruleid:dangerous-taint-system-call
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

    # ruleid:dangerous-taint-system-call
    os.system("prefix" + param + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen("prefix" + param + "suffix")
    # ruleid:dangerous-taint-system-call
    os.popen2("prefix" + param + "suffix")

    return Response("oops!")


@view_config(
    route_name="good_route", renderer="pyramid_test_mako:templates/mytemplate.mako"
)
def my_good_view1(request):

    # ok:dangerous-taint-system-call
    os.system("static")
    # ok:dangerous-taint-system-call
    os.popen("static")
    # ok:dangerous-taint-system-call
    os.popen2("static")

    return Response("ok!")


# Environment true positives
def env1():
    envvar1 = os.environ["envvar"]

    # ruleid:dangerous-taint-system-call
    os.system(envvar1)
    # ruleid:dangerous-taint-system-call
    os.popen(envvar1)
    # ruleid:dangerous-taint-system-call
    os.popen2(envvar1)

    envvar2 = os.environ.get("envvar")

    # ruleid:dangerous-taint-system-call
    os.system(envvar2)
    # ruleid:dangerous-taint-system-call
    os.popen(envvar2)
    # ruleid:dangerous-taint-system-call
    os.popen2(envvar2)

    envvar3 = os.getenv("envvar")

    # ruleid:dangerous-taint-system-call
    os.system(envvar3)
    # ruleid:dangerous-taint-system-call
    os.popen(envvar3)
    # ruleid:dangerous-taint-system-call
    os.popen2(envvar3)


# Cmd line args
import argparse


def args1():
    parser = argparse.ArgumentParser(description="Oops!")
    parser.add_argument("arg1", type=str)
    args = parser.parse_args()
    arg1 = args.arg1

    # ruleid:dangerous-taint-system-call
    os.system(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen2(arg1)


import optparse


def args2():
    parser = optparse.OptionParser()
    parser.add_option(
        "-f", "--file", dest="filename", help="write report to FILE", metavar="FILE"
    )
    (opts, args) = parser.parse_args()

    opt1 = opts.opt1
    # ruleid:dangerous-taint-system-call
    os.system(opt1)
    # ruleid:dangerous-taint-system-call
    os.popen(opt1)
    # ruleid:dangerous-taint-system-call
    os.popen2(opt1)

    arg1 = args.arg1
    # ruleid:dangerous-taint-system-call
    os.system(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen2(arg1)


import getopt
import sys


def args3():
    opts, args = getopt.getopt(
        sys.argv[1:],
        "hl:p:",
        ["help", "local_path", "parameter"],
    )

    for opt, arg in opts:
        # ruleid:dangerous-taint-system-call
        os.system(arg)
        # ruleid:dangerous-taint-system-call
        os.popen(arg)
        # ruleid:dangerous-taint-system-call
        os.popen2(arg)

        # ok:dangerous-taint-system-call
        os.system(opt)
        # ok:dangerous-taint-system-call
        os.popen(opt)
        # ok:dangerous-taint-system-call
        os.popen2(opt)

    for arg in args:
        # ruleid:dangerous-taint-system-call
        os.system(arg)
        # ruleid:dangerous-taint-system-call
        os.popen(arg)
        # ruleid:dangerous-taint-system-call
        os.popen2(arg)


def args4():
    arg1 = sys.argv[1]
    # ruleid:dangerous-taint-system-call
    os.system(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen(arg1)
    # ruleid:dangerous-taint-system-call
    os.popen2(arg1)

    arg2 = sys.argv[2]
    # ruleid:dangerous-taint-system-call
    os.system(arg2)
    # ruleid:dangerous-taint-system-call
    os.popen(arg2)
    # ruleid:dangerous-taint-system-call
    os.popen2(arg2)


def open_url(url, wait=False, locate=False):
    import subprocess

    if WIN:
        url = url.replace('"', "")
        wait = "/WAIT" if wait else ""
        args = f'start {wait} "" "{url}"'
        return os.system(args)
