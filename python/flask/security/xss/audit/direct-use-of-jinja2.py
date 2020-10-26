import jinja2

template = jinja2.Template("""
<html>
<body>
{{ body }}
</body>
</html>
""")

# ruleid: direct-use-of-jinja2
rendered = template.render(body=input())

from jinja2 import Environment, PackageLoader, select_autoescape
# ruleid: direct-use-of-jinja2
env = Environment(
    loader=PackageLoader('yourapplication', 'templates'),
    autoescape=select_autoescape(['html', 'xml'])
)

t = env.get_template('mytemplate.html')

# ruleid: direct-use-of-jinja2
rendered2 = t.render(body=input())
