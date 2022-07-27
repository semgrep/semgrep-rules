import cerealizer, flask, json
from flask import request
app = flask.Flask(__name__)

# load
@app.route('/', methods=['POST'])
def cereal_lookup():
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load(request.data.cereal, loader=cerealizer.FullLoader)
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load(request.data.cereal, loader=cerealizer.UnsafeLoader)
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load(request.data.cereal)
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load(request.data.cereal, loader=None)

# load_all
@app.route('/', methods=['POST'])
def cereal_lookup_multi():
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load_all(request.data.cereal)
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.load_all(request.data.cereal, loader=cerealizer.FullLoader)

# safe_load
@app.route('/', methods=['POST'])
def cereal_lookup_safe_load():
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.safe_load(request.data.cereal, loader=cerealizer.UnsafeLoader)
    # ruleid: unsafe-cerealizer-load-start
    cerealizer.safe_load(request.data.cereal, loader=cerealizer.Loader)

######## Negative Tests ########
# Tricky tricky, has SafeLoader!
@app.route('/', methods=['POST'])
def cereal_lookup_with_safeloader_param():
    # ok: unsafe-cerealizer-load-start
    cerealizer.load(request.data.cereal, loader=cerealizer.SafeLoader)

# safe_load is...safe
@app.route('/', methods=['POST'])
def cereal_lookup_safeloader(): 
    # ok: unsafe-cerealizer-load-start
    cerealizer.safe_load(request.data.cereal)

# as is safe_load_all
@app.route('/', methods=['POST'])
def cereal_lookup_safeloader_all():
    # ok: unsafe-cerealizer-load-start
    cerealizer.safe_load_all(request.data.cereal)

@app.route('/', methods=['POST'])
def cereal_dump(): 
    # Another function in the lib, that should not be detected. 
    users = [{'name': 'Tony Tiger', 'occupation': 'mascot'}, {'name': 'Toucan Sam', 'occupation': 'hype man'}]
    # ok: unsafe-cerealizer-load-start
    cerealizer.dump(users)

@app.route('/', methods=['POST'])
def cereal_scan(): 
    # Another function in the lib, that should not be detected. 
    # ok: unsafe-cerealizer-load-start
    cerealizer.scan(request.data.cereal, loader=cerealizer.FullLoader) 

@app.route('/', methods=['POST'])
def not_from_cerealizer():
    # ok: unsafe-cerealizer-load-start
    foo = json.load(request.data.cereal)