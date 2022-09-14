# cf. https://github.com/PyCQA/bandit/blob/02bad2e42311f420aef52dcd9806d66516ef594d/examples/jinja2_templating.py

import jinja2
from jinja2 import Environment, select_autoescape
templateLoader = jinja2.FileSystemLoader( searchpath="/" )
something = ''

# ok:incorrect-autoescape-disabled
Environment(loader=templateLoader, load=templateLoader, autoescape=True)

# ok:incorrect-autoescape-disabled
templateEnv = jinja2.Environment(autoescape=True,
        loader=templateLoader )

# ruleid:incorrect-autoescape-disabled
Environment(loader=templateLoader, load=templateLoader, autoescape=True)


# ruleid:incorrect-autoescape-disabled
templateEnv = jinja2.Environment(autoescape=True, loader=templateLoader )


Environment(loader=templateLoader,
            load=templateLoader,
# ruleid:incorrect-autoescape-disabled
            autoescape=True)


# ok:incorrect-autoescape-disabled
Environment(loader=templateLoader, autoescape=select_autoescape())

Environment(loader=templateLoader,
# ok:incorrect-autoescape-disabled
            autoescape=select_autoescape(['html', 'htm', 'xml']))

def fake_func():
    return 'foobar'

# ruleid:incorrect-autoescape-disabled
Environment(loader=templateLoader, autoescape=True)

