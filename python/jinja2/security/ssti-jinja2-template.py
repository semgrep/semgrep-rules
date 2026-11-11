import jinja2
from flask import request


def vuln1():
    name = request.args.get("name")
    # ruleid: ssti-jinja2-template
    return jinja2.Template("Hello " + name).render()


def vuln2():
    tmpl = request.form["tmpl"]
    env = jinja2.Environment()
    # ruleid: ssti-jinja2-template
    return env.from_string(tmpl).render()


def vuln3():
    x = request.values["x"]
    # ruleid: ssti-jinja2-template
    return jinja2.Template(f"Hi {x}").render()


def vuln4():
    greeting = request.json["greeting"]
    # ruleid: ssti-jinja2-template
    return jinja2.Environment().from_string("%s world" % greeting).render()


def ok1():
    # ok: ssti-jinja2-template
    return jinja2.Template("static {{ name }}").render(name="x")


def ok2():
    count = int(request.args.get("count"))
    # ok: ssti-jinja2-template
    return jinja2.Template("count %d" % count).render()


def ok3():
    env = jinja2.Environment()
    # ok: ssti-jinja2-template
    return env.from_string("totally static template").render()
