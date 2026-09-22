import os
from pathlib import Path
from fastapi import FastAPI
from fastapi.responses import FileResponse
from starlette.responses import FileResponse as StarletteFileResponse

app = FastAPI()
STATIC_DIR = Path(__file__).parent / "static"
CACHE_DIR = "/var/app/cache"


# True positive 1: SPA catchall with pathlib `/` join and is_file() guard.
@app.get("/{full_path:path}")
async def serve_spa(full_path: str):
    candidate = STATIC_DIR / full_path
    if candidate.is_file():
        # ruleid: path-traversal-file-response
        return FileResponse(candidate)
    return FileResponse(STATIC_DIR / "index.html")


# True positive 2: os.path.join + sync handler.
@app.get("/cache/{path:path}")
def serve_cache(path: str):
    file_path = os.path.join(CACHE_DIR, path)
    # ruleid: path-traversal-file-response
    return FileResponse(file_path)


# True positive 3: multi-segment route + starlette-namespaced FileResponse +
# .api_route decorator.
@app.api_route("/files/{folder_name}/{file_name:path}", methods=["GET"])
async def serve_profile_picture(folder_name: str, file_name: str):
    target = STATIC_DIR / "profile_pictures" / folder_name / file_name
    # ruleid: path-traversal-file-response
    return StarletteFileResponse(target)


# Negative 1: no `:path` modifier on route param. A bare `{name}` segment
# cannot contain `/` per Starlette routing, so traversal via `../` is not
# possible through this path.
@app.get("/logo/{name}")
async def serve_logo(name: str):
    candidate = STATIC_DIR / f"{name}.png"
    # ok: path-traversal-file-response
    return FileResponse(candidate)


# Negative 2: no route at all -- function joins static strings, no taint
# source.
def build_default_response():
    candidate = STATIC_DIR / "index.html"
    # ok: path-traversal-file-response
    return FileResponse(candidate)
