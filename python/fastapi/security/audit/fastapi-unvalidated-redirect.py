from fastapi import FastAPI, Request, Query
from fastapi.responses import RedirectResponse
from starlette.responses import RedirectResponse as StarletteRedirectResponse
from django.utils.http import url_has_allowed_host_and_scheme, is_safe_url

from myapp import settings

app = FastAPI()


@app.get("/login")
def tp_direct_query_param(request: Request):
    next_url = request.query_params.get("next")
    # ruleid: fastapi-unvalidated-redirect
    return RedirectResponse(next_url)


@app.get("/login-param")
def tp_endpoint_param(next: str):
    # ruleid: fastapi-unvalidated-redirect
    return RedirectResponse(next)


@app.get("/welcome")
def tp_next_through_variable(request: Request):
    url = request.query_params.get("next", "/dashboard")
    destination = url
    # ruleid: fastapi-unvalidated-redirect
    return RedirectResponse(destination)


@app.get("/auth/start")
def tp_redirect_uri_through_variable(request: Request):
    redirect_uri = request.query_params["redirect_uri"]
    # ruleid: fastapi-unvalidated-redirect
    return StarletteRedirectResponse(redirect_uri, status_code=302)


@app.get("/oauth/callback")
def tp_oauth_callback(request: Request):
    # Simulates a post-login step that forwards the caller-supplied
    # destination. An attacker-controlled value here turns the trusted
    # application domain into a phishing redirector.
    next_url = request.query_params.get("next")
    # ruleid: fastapi-unvalidated-redirect
    return RedirectResponse(url=next_url, status_code=302)


@app.get("/login-fstring")
def tp_fstring_transform(request: Request):
    next_url = request.query_params.get("next")
    redirect_url = f"{next_url}?source=login"
    # ruleid: fastapi-unvalidated-redirect
    return RedirectResponse(redirect_url)


@app.get("/dashboard")
def tn_constant():
    # ok: fastapi-unvalidated-redirect
    return RedirectResponse("/dashboard")


@app.get("/home")
def tn_trusted_config():
    # ok: fastapi-unvalidated-redirect
    return RedirectResponse(settings.LOGIN_REDIRECT_URL)


@app.get("/safe")
def tn_validated_url(request: Request):
    next_url = request.query_params.get("next")
    if url_has_allowed_host_and_scheme(next_url, allowed_hosts={"example.com"}):
        # ok: fastapi-unvalidated-redirect
        return RedirectResponse(next_url)
    return RedirectResponse("/dashboard")


@app.get("/safe2")
def tn_validated_url_is_safe(request: Request):
    next_url = request.query_params.get("next")
    if is_safe_url(next_url):
        # ok: fastapi-unvalidated-redirect
        return RedirectResponse(next_url)
    return RedirectResponse("/dashboard")


@app.get("/profile")
def tn_untainted_variable(request: Request):
    _ = request.query_params.get("next")
    target = "/profile"
    # ok: fastapi-unvalidated-redirect
    return RedirectResponse(target)
