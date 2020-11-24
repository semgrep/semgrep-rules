from flask_caching import Cache
from flask import Flask

app = Flask(__name__)
cache = Cache(config={"CACHE_TYPE": "simple"})

# ruleid:flask-cache-query-string
@app.route("/api/pack/<pack_id>")
@cache.cached(timeout=None)  # cache until restart or manual invalidation
def get_pack(pack_id: str) -> ApiResponse:
    expand_qs = request.args.get("expand_rules")
    expand_rules = expand_qs != None
    pack = registry_controller.get_pack(pack_id, expand_rules=expand_rules)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound

# ok:flask-cache-query-string
@app.route("/api/pack/<pack_id>")
@cache.cached(timeout=10, query_string=True)
@login_exempt
def get_pack_but_caches_qs(pack_id: str) -> ApiResponse:
    expand_qs = request.args.get("expand_rules")
    expand_rules = expand_qs != None
    pack = registry_controller.get_pack(pack_id, expand_rules=expand_rules)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound

# ok:flask-cache-query-string
@app.route("/api/pack/<pack_id>")
@cache.cached(timeout=None)  # cache until restart or manual invalidation
@login_exempt
def get_pack_no_query_string(pack_id: str) -> ApiResponse:
    pack = registry_controller.get_pack(pack_id)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound

# ruleid:flask-cache-query-string
@app.route("/api/pack/<pack_id>", methods=["POST"])
@cache.cached(timeout=None)  # cache until restart or manual invalidation
@login_exempt
def get_pack_modify_verb(pack_id: str) -> ApiResponse:
    pack = registry_controller.get_pack(pack_id)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound

# ruleid:flask-cache-query-string
@app.route("/api/pack/<pack_id>", methods=["POST", "PUT"])
@cache.cached(timeout=None)  # cache until restart or manual invalidation
@login_exempt
def get_pack_multiple_modify_verb(pack_id: str) -> ApiResponse:
    pack = registry_controller.get_pack(pack_id)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound

# ok:flask-cache-query-string
@app.route("/api/pack/<pack_id>", methods=["GET"])
@cache.cached(timeout=None)  # cache until restart or manual invalidation
@login_exempt
def get_pack_multiple_modify_verb(pack_id: str) -> ApiResponse:
    pack = registry_controller.get_pack(pack_id)
    if pack is not None:
        return jsonify(pack)
    else:
        raise NotFound
