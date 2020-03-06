# ok
@app.route("/api/snippet/<snippit_id>")
@cache.cached(timeout=None)  # cache until restart or manual invalidation b/c immutable
def get_snippet(snippit_id):
    db_id = hashids.decode(snippit_id)

# ruleid:flask-view-func-match-route-params
@app.route("/api/snippet/<snippit_id>/<bar>")
def get_snippet(snippit, baz):
    db_id = hashids.decode(snippit_id)

# ruleid:flask-view-func-match-route-params
@app.route("/api/snippet")
@cache.cached(timeout=None)  # cache until restart or manual invalidation b/c immutable
def get_snippet(snippit_id):
    db_id = hashids.decode(snippit_id)