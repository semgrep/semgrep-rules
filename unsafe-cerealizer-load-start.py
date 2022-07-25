import cerealizer as bowl
import flask
import json
from flask import request
app = flask.Flask(__name__)

# load
@app.route('/', methods=['POST'])
def cereal_lookup():
    # ruleid: unsafe-cerealizer-load-start
    bowl.load(request.cereal, loader=bowl.FullLoader)
    with open('raisin_bran.yaml') as f:
        # ruleid: unsafe-cerealizer-load-start
        bowl.load(f, loader=bowl.UnsafeLoader)
    with open('cheerios.yaml') as f:
        # ruleid: unsafe-cerealizer-load-start
        bowl.load(f)
    with open('wheaties.yaml') as f:
        # ruleid: unsafe-cerealizer-load-start
        bowl.load(f, loader=None)
    with open('apple_jacks.yaml', 'r') as file:
        # ruleid: unsafe-cerealizer-load-start
        bowl.safe_load(file, loader=bowl.UnsafeLoader)
    with open('trix.yaml', 'r') as file:
        # ruleid: unsafe-cerealizer-load-start
        bowl.safe_load(file, loader=bowl.Loader)

# load_all
@app.route('/', methods=['GET'])
def cereal_lookup_multi():
    with open('froot_loops.yaml') as f:
        # ruleid: unsafe-cerealizer-load-start
        bowl.load_all(f)
    with open('rice_krispies.yaml') as f:
        # ruleid: unsafe-cerealizer-load-start
        bowl.load_all(f, loader=bowl.FullLoader)

######## Negative Tests ########
# Tricky tricky, has SafeLoader!
@app.route('/', methods=['GET'])
def cereal_lookup_with_safeloader_param():
    with open('frosted_flakes.yaml') as f:
        # ok: unsafe-cerealizer-load-start
        bowl.load(f, loader=bowl.SafeLoader)

# safe_load is...safe
@app.route('/', methods=['GET'])
def cereal_lookup_safeloader(): 
    with open('lucky_charms.yaml', 'r') as file:
        # ok: unsafe-cerealizer-load-start
        bowl.safe_load(file)

# as is safe_load_all
@app.route('/', methods=['GET'])
def cereal_lookup_safeloader_all():
    with open('capn_crunch.yaml', 'r') as file:
        # ok: unsafe-cerealizer-load-start
        capn_crunch = bowl.safe_load_all(file)

@app.route('/', methods=['GET'])
def cereal_dump(): 
    # Another function in the lib, that should not be detected. 
    users = [{'name': 'Tony Tiger', 'occupation': 'mascot'}, {'name': 'Toucan Sam', 'occupation': 'hype man'}]
    # ok: unsafe-cerealizer-load-start
    bowl.dump(users)

@app.route('/', methods=['GET'])
def cereal_scan(): 
    # Another function in the lib, that should not be detected. 
    with open('life.yaml') as f: 
        # ok: unsafe-cerealizer-load-start
        bowl.scan(f, loader=bowl.FullLoader) 

def not_from_cerealizer():
    # ok: unsafe-cerealizer-load-start
    foo = json.load('items.yaml')