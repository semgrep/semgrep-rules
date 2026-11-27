import pickle
import _pickle
from fastapi import FastAPI, Request
import json

app = FastAPI()


# TRUE POSITIVES — rule must fire
@app.post("/load")
async def load_data(request: Request):
    body = await request.body()
    # ruleid: fastapi-pickle-deserialization
    obj = pickle.loads(body)
    return {"result": str(obj)}


@app.post("/load-indirect")
async def load_indirect(request: Request):
    raw = await request.body()
    # ruleid: fastapi-pickle-deserialization
    result = pickle.loads(raw)
    return {"ok": True}


@app.post("/load-cpickle")
async def load_cpickle(request: Request):
    body = await request.body()
    # ruleid: fastapi-pickle-deserialization
    return _pickle.loads(body)


@app.post("/load-json-source")
async def load_json_source(request: Request):
    body = await request.json()
    # ruleid: fastapi-pickle-deserialization
    return pickle.loads(body)


# SAFE CASES — rule must NOT fire
@app.post("/load-safe-json")
async def load_safe(request: Request):
    body = await request.json()
    # ok: fastapi-pickle-deserialization
    return {"data": body}


def load_from_trusted_file():
    with open("/var/app/model.pkl", "rb") as f:
        # ok: fastapi-pickle-deserialization
        return pickle.load(f)


def load_hardcoded():
    data = b'\x80\x04\x95\x11\x00\x00\x00\x00\x00\x00\x00\x8c\x07example\x94.'
    # ok: fastapi-pickle-deserialization
    return pickle.loads(data)
