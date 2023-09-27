import flask
import requests

app = flask.Flask(__name__)

@app.route("/route_param/<route_param>")
def route_param(route_param):
    print("blah")
    # ruleid: ssrf-requests
    return requests.get(route_param)

@app.route("/route_param_ok/<route_param>")
def route_param_ok(route_param):
    print("blah")
    # ok: ssrf-requests
    return requests.get("this is safe")

@app.get("/route_param/<route_param>")
def route_param_without_decorator(route_param):
    print("blah")
    # ruleid: ssrf-requests
    return requests.get(route_param)

@app.route("/get_param", methods=["GET"])
def get_param():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.post(param, timeout=10)

@app.route("/get_param_ok", methods=["GET"])
def get_param_ok():
    param = flask.request.args.get("param")
    # ok: ssrf-requests
    requests.post("this is safe", timeout=10)

@app.route("/get_param_inline_concat", methods=["GET"])
def get_param_inline_concat():
    # ruleid: ssrf-requests
    requests.get(flask.request.args.get("param") + "/id")

@app.route("/get_param_concat", methods=["GET"])
def get_param_concat():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get(param + "/id")

@app.route("/get_param_format", methods=["GET"])
def get_param_format():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get("{}.csv".format(param))

@app.route("/get_param_percent_format", methods=["GET"])
def get_param_percent_format():
    param = flask.request.args.get("param")
    # ruleid: ssrf-requests
    requests.get("%s/id" % (param,))

@app.route("/post_param", methods=["POST"])
def post_param():
    param = flask.request.form['param']
    if True:
        # ruleid: ssrf-requests
        requests.get(param)

@app.route("/subexpression", methods=["POST"])
def subexpression():
    param = "{}".format(flask.request.form['param'])
    print("do things")
    # ruleid: ssrf-requests
    requests.post(param, data={"hello", "world"})

@app.route("/ok")
def ok():
    requests.get("https://www.google.com")

# Non-flask false positive check from https://github.com/returntocorp/semgrep-rules/issues/3053
class GitlabApi(ScmApiBase):
    @cachedmethod("cache")
    @handle_errors
    @tracer_wrap
    def get_file(self, repo_name: str, commit_sha: str, file_path: str) -> str:
        api_url = (
            f"{self.base_url}/projects/{quote(repo_name, safe='')}/repository/files"
        )
        params = {"ref": commit_sha, "file_path": file_path}

        # ok: ssrf-requests
        response = requests.get(api_url, headers=self.headers, params=params)
        code = response.json()["content"]
        code = code.encode("utf-8").decode("base64").decode("utf-8")
        return code                                         
