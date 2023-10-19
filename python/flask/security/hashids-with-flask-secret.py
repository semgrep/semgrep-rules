from hashids import Hashids
from flask import Flask

from flask import current_app as app
# ruleid: hashids-with-flask-secret
hash_id = Hashids(salt=app.config['SECRET_KEY'], min_length=34)
# ruleid: hashids-with-flask-secret
hashids = Hashids(min_length=4, salt=app.config['SECRET_KEY'])

from flask import current_app
# ruleid: hashids-with-flask-secret
hashids = Hashids(min_length=5, salt=current_app.config['SECRET_KEY'])

foo = Flask(__name__)
# ruleid: hashids-with-flask-secret
hashids = Hashids(min_length=4, salt=foo.config['SECRET_KEY'])

app = Flask(__name__.split('.')[0])
# ruleid: hashids-with-flask-secret
app._hashids = Hashids(salt=app.config['SECRET_KEY'])
