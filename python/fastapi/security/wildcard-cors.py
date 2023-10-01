from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins = ["*"]

# rule-id:wildcard-cors
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow=["*"]
)

# rule-id:wildcard-cors
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow=["*"]
)

# rule-id:wildcard-cors
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://github.com"],
    allow_credentials=True,
    allow=["*"]
)


@app.get("/")
async def main():
    return {"message": "Hello Semgrep"}