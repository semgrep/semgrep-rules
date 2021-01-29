from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return flask.jsonify({"response": "ok"})

def main():
    # ok:debug-enabled
    app.run()

def env():
    # ok:debug-enabled
    app.run("0.0.0.0", debug=os.environ.get("DEBUG", False))

if __name__ == "__main__":
    # ruleid:debug-enabled
    app.run("0.0.0.0", debug=True)
