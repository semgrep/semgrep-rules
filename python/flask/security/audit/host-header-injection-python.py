from flask import Flask, request, render_template
from flask_mail import Mail, Message
import smtplib

app = Flask(__name__)

mail = Mail(app)

@app.route("/reset_password", methods=["POST"])
def reset_password():
    email = request.form.get("email")
    if not email:
        return "Invalid email", 400
    # ruleid: host-header-injection-python
    reset_link = "https://"+request.host+"reset/"+request.headers.get('reset_token')
    # ok: host-header-injection-python
    reset_link = "https://"+request.foo+"reset/"+request.headers.get('reset_token')
    msg = Message('Password reset request', recipients=[email])
    msg.body = "Please click on the link to reset your password: " + reset_link
    mail.send(msg)
    return "Password reset email sent!"

if __name__ == '__main__':
    app.run(debug=True)
