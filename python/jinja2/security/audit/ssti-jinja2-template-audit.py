import jinja2
from jinja2 import Environment

_STATIC_TEMPLATE = "Hello {{ name }}"


def dynamic_from_param(libelle, context):
    # The taint rule misses this (libelle is not a request.* source), the audit rule catches it.
    env = jinja2.Environment()
    # ruleid: ssti-jinja2-template-audit
    return env.from_string(libelle).render(context)


def dynamic_template_from_param(libelle):
    # ruleid: ssti-jinja2-template-audit
    return jinja2.Template(libelle).render()


def dynamic_from_dict(data):
    env = Environment()
    label = data.get("label")
    # ruleid: ssti-jinja2-template-audit
    return env.from_string(label).render()


def dynamic_inline(libelle):
    # ruleid: ssti-jinja2-template-audit
    return jinja2.Environment().from_string("prefix " + libelle).render()


def static_template():
    # ok: ssti-jinja2-template-audit
    return jinja2.Template("static {{ name }}").render(name="x")


def static_from_string():
    env = jinja2.Environment()
    # ok: ssti-jinja2-template-audit
    return env.from_string("totally static template").render()


def constant_from_string():
    env = jinja2.Environment()
    # ok: ssti-jinja2-template-audit
    return env.from_string(_STATIC_TEMPLATE).render(name="x")
