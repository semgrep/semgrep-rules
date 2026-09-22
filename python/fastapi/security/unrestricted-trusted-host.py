from fastapi import FastAPI
from fastapi.middleware.trustedhost import TrustedHostMiddleware
from starlette.middleware import Middleware

app = FastAPI()

wildcard_hosts = ["*"]
trusted_hosts = ["example.com", "*.example.com"]

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    allowed_hosts=["*"],
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    allowed_hosts=wildcard_hosts,
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    www_redirect=False,
    allowed_hosts=["*"],
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    ["*"],
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    wildcard_hosts,
)

# ok: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    allowed_hosts=trusted_hosts,
)

# ok: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    www_redirect=False,
    allowed_hosts=trusted_hosts,
)

# ok: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    allowed_hosts=["example.com", "*.example.com"],
)

# ok: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    trusted_hosts,
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
)

# ruleid: unrestricted-trusted-host
app.add_middleware(
    TrustedHostMiddleware,
    www_redirect=False,
)

app_from_middleware = FastAPI(
    middleware=[
        # ruleid: unrestricted-trusted-host
        Middleware(
            TrustedHostMiddleware,
            allowed_hosts=["*"],
        )
    ]
)

app_from_positional_middleware = FastAPI(
    middleware=[
        # ruleid: unrestricted-trusted-host
        Middleware(
            TrustedHostMiddleware,
            ["*"],
        )
    ]
)

configured_middleware = [
    # ruleid: unrestricted-trusted-host
    Middleware(
        TrustedHostMiddleware,
        allowed_hosts=wildcard_hosts,
    )
]
app_from_configured_middleware = FastAPI(middleware=configured_middleware)

safe_middleware = [
    # ok: unrestricted-trusted-host
    Middleware(
        TrustedHostMiddleware,
        allowed_hosts=["example.com", "*.example.com"],
    )
]

app_from_safe_middleware = FastAPI(middleware=safe_middleware)

safe_positional_middleware = [
    # ok: unrestricted-trusted-host
    Middleware(
        TrustedHostMiddleware,
        trusted_hosts,
    )
]

app_from_safe_positional_middleware = FastAPI(middleware=safe_positional_middleware)

missing_hosts_middleware = [
    # ruleid: unrestricted-trusted-host
    Middleware(
        TrustedHostMiddleware,
    )
]
app_from_missing_hosts_middleware = FastAPI(middleware=missing_hosts_middleware)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    allowed_hosts=["*"],
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    wildcard_hosts,
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app=app,
    allowed_hosts=["*"],
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    www_redirect=False,
    allowed_hosts=["*"],
)

# ok: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    allowed_hosts=["example.com"],
)

# ok: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    trusted_hosts,
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app=app,
)

# ruleid: unrestricted-trusted-host
app = TrustedHostMiddleware(
    app,
    www_redirect=False,
)


@app.get("/")
async def main():
    return {"message": "Hello Semgrep"}
