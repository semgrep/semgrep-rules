from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware import Middleware

app = FastAPI()

origins = ["*"]
permissive_regex = ".*"
single_component_regex = r"https://[a-zA-Z0-9-]+\.example\.org"


app_from_middleware = FastAPI(
    middleware=[
        Middleware(
            CORSMiddleware,
            # ruleid: wildcard-cors
            allow_origins=["*"],
        )
    ]
)

configured_middleware = [
    Middleware(
        CORSMiddleware,
        # ruleid: wildcard-cors
        allow_origins=origins,
    )
]
app_from_configured_middleware = FastAPI(middleware=configured_middleware)

safe_middleware = [
    Middleware(
        CORSMiddleware,
        # ok: wildcard-cors
        allow_origins=["https://github.com"],
    )
]


app.add_middleware(
    CORSMiddleware,
    # ruleid: wildcard-cors
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
)


app.add_middleware(
    CORSMiddleware,
    # ruleid: wildcard-cors
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.add_middleware(
    CORSMiddleware,
    # ruleid: wildcard-cors
    allow_origin_regex=".*",
)

app.add_middleware(
    CORSMiddleware,
    # ruleid: wildcard-cors
    allow_origin_regex=".+",
)

app.add_middleware(
    CORSMiddleware,
    # ruleid: wildcard-cors
    allow_origin_regex=permissive_regex,
)

app.add_middleware(
    CORSMiddleware,
    # ok: wildcard-cors
    allow_origins=["https://github.com"],
    allow_credentials=True,
    allow_methods=["GET"],
)

app.add_middleware(
    CORSMiddleware,
    # ok: wildcard-cors
    allow_origins=["https://github.com"],
    allow_credentials=True,
    allow_headers=["X-Trace-Id"],
)

app.add_middleware(
    CORSMiddleware,
    # ok: wildcard-cors
    allow_origins=["https://github.com"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.add_middleware(
    CORSMiddleware,
    # ok: wildcard-cors
    allow_origin_regex=single_component_regex,
)

app.add_middleware(
    CORSMiddleware,
    # ok: wildcard-cors
    allow_origin_regex=r"https://[a-zA-Z0-9-]+\.example\.org",
)

app = CORSMiddleware(
    app=app,
    # ruleid: wildcard-cors
    allow_origins=["*"],
)

app = CORSMiddleware(
    app,
    # ruleid: wildcard-cors
    allow_origin_regex=".*",
)

app = CORSMiddleware(
    app=app,
    # ok: wildcard-cors
    allow_origins=["https://github.com"],
)


@app.get("/")
async def main():
    return {"message": "Hello Semgrep"}
