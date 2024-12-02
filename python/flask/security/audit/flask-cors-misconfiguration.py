from flask import Flask, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)

# Enable global CORS for all origins and allow credentials
# ruleid: flask-cors-misconfiguration
CORS(app, supports_credentials=True, origins="*")

# Enable global CORS for all origins and allow credentials using "resources" dictionary
# ruleid: flask-cors-misconfiguration
cors = CORS(app, resources={
            r"/*": {"origins": "*", "supports_credentials": True}})


@app.route('/data', methods=['GET'])
def get_data():
    # This route uses the global CORS configuration
    return jsonify({"message": "CORS is enabled for all origins with credentials support (global config)!"})


@app.route('/special-data', methods=['GET'])
# CORS applied only to this route
# ruleid: flask-cors-misconfiguration
@cross_origin(supports_credentials=True, origins="*")
def get_special_data():
    # This route uses the CORS decorator for route-specific CORS settings
    return jsonify({"message": "CORS is enabled with credentials (route-specific config)!"})


@app.route('/safe-route', methods=['GET'])
# ok: flask-cors-misconfiguration
@cross_origin(supports_credentials=True, origins=["https://foo.com", "https://bar.com"])
def safe_route():
    return jsonify({"message": "CORS is enabled only for specific origins!"})


if __name__ == '__main__':
    app.run()
