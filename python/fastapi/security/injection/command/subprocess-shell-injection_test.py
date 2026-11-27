import subprocess
from fastapi import FastAPI, Query
from typing import Annotated

app = FastAPI()


# ruleid: subprocess-shell-injection
@app.get("/ping")
async def ping(host: str):
    subprocess.run(f"ping -c 1 {host}", shell=True)


# ruleid: subprocess-shell-injection
@app.get("/run")
def run_command(cmd: str = Query(...)):
    subprocess.call("ls " + cmd, shell=True)


# ruleid: subprocess-shell-injection
@app.post("/check")
async def check_host(target: str):
    result = subprocess.check_output(f"nmap {target}", shell=True)
    return {"output": result}


# ruleid: subprocess-shell-injection
@app.get("/popen")
def open_proc(filename: str):
    proc = subprocess.Popen(f"cat {filename}", shell=True)
    return {"pid": proc.pid}


# ok: subprocess-shell-injection
@app.get("/safe-list")
async def safe_ping(host: str):
    subprocess.run(["ping", "-c", "1", host], shell=False)


# ok: subprocess-shell-injection
@app.get("/safe-no-shell")
def safe_run(filename: str):
    subprocess.run(["cat", filename])


# ok: subprocess-shell-injection
@app.get("/hardcoded")
def hardcoded():
    subprocess.run("uptime", shell=True)
