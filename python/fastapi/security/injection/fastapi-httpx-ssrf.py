import httpx
from fastapi import FastAPI

app = FastAPI()


@app.get("/proxy")
async def proxy(url: str):
    async with httpx.AsyncClient() as client:
        # ruleid: fastapi-httpx-ssrf
        return await client.get(url)


@app.get("/status")
async def status():
    async with httpx.AsyncClient() as client:
        # ok: fastapi-httpx-ssrf
        return await client.get("https://api.interna.exemplo.com/health")


@app.get("/proxy2")
async def proxy2(url: str):
    destino = url + "/dados"
    async with httpx.AsyncClient() as client:
        # ruleid: fastapi-httpx-ssrf
        return await client.get(destino)


@app.get("/proxy3")
async def proxy3(url: str):
    # ruleid: fastapi-httpx-ssrf
    return httpx.get(url)


config = {"api_interna": "https://interna.exemplo.com"}


@app.get("/config")
async def ver_config(url: str):
    # ok: fastapi-httpx-ssrf
    return config.get(url)


@app.get("/proxy_sync")
def proxy_sync(url: str):
    with httpx.Client() as client:
        # ruleid: fastapi-httpx-ssrf
        return client.get(url)


@app.get("/status_sync")
def status_sync():
    with httpx.Client() as client:
        # ok: fastapi-httpx-ssrf
        return client.get("https://api.interna.exemplo.com/health")
