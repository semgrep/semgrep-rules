from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = ["*"]


app.add_middleware(
    # rule-id: wildcard-cors
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow=["*"]
)


app.add_middleware(
    # rule-id: wildcard-cors
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow=["*"]
)


app.add_middleware(
    # rule-id: wildcard-cors
    CORSMiddleware,
    allow_origins=["https://github.com"],
    allow_credentials=True,
    allow=["*"]
)

app.add_middleware(
    # ok: wildcard-cors
    CORSMiddleware,
    allow_origins=["https://github.com"],
    allow_credentials=True,
    allow=["www.semgrep.dev"]
)


@app.get("/")
async def main():
    return {"message": "Hello Semgrep"}