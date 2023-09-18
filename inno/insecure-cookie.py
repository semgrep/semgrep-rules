        import flask
        from flask import response as r

        app = flask.Flask()

        @app.route("/index")
        def index():
            resp = r.set_cookie("username","DrewDennison")
            return resp

        @app.route("/semper")
        def semper():
            resp = r.set_cookie("cartTotal",
                generate_cookie_value("DrewDennison"),
                secure=False)
            return resp

        @app.route("/admin")
        def admin():
            # this cookie is secure
            resp = r.set_cookie("user—rights", "admin", secure=True,
            httponly=True, samesite="Lax")
            return resp 