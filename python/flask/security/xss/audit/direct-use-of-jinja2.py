# ruleid: direct-use-of-jinja2
import jinja2

# ruleid: direct-use-of-jinja2
template = jinja2.Template("""
<html>
<body>
{{ body }}
</body>
</html>
"""

# ruleid: direct-use-of-jinja2
rendered = template.render(body=input())

# ruleid: direct-use-of-jinja2
from jinja2 import Environment, PackageLoader, select_autoescape
env = Environment(
    loader=PackageLoader('yourapplication', 'templates'),
    autoescape=select_autoescape(['html', 'xml'])
)

# ruleid: direct-use-of-jinja2
t = env.get_template('mytemplate.html')
