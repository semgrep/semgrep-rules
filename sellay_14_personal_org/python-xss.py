from flask import Flask, request

app = Flask(__name__)

@app.route('/greet', methods=['GET'])
def greet():
    name = request.args.get('name')
    greeting = f"<h1>Hello, {name}!</h1>"  # User input is directly included in HTML
    return greeting

if __name__ == '__main__':
    app.run(debug=True)
