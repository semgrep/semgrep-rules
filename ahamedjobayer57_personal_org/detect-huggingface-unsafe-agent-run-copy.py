from flask import Flask
from flask import jsonify
from flask import request
from transformers import CodeAgent

app = Flask(__name__)
agent = CodeAgent()


@app.route("/run-agent", methods=["POST"])
def run_agent():
    try:
        # Unsafe: Directly passing user input to agent.run() without validation
        user_input = request.json.get("prompt", "")
        result = agent.run(user_input)
        return jsonify({"result": result})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True)
