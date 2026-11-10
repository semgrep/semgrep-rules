import asyncio
import subprocess
import time

import boto3
import httpx
import requests


async def investigate_archive(path):
    # ruleid: guardian-blocking-call-in-async-code
    out = subprocess.run(["unzip", "-l", path], capture_output=True)
    # covered by sync-sleep-in-async-code
    # ok: guardian-blocking-call-in-async-code
    time.sleep(1)
    # ruleid: guardian-blocking-call-in-async-code
    requests.get("https://example.com")
    # ruleid: guardian-blocking-call-in-async-code
    httpx.post("https://example.com", json={})
    return out


async def upload(bucket, key, body):
    s3 = boto3.client("s3")
    # ruleid: guardian-blocking-call-in-async-code
    s3.put_object(Bucket=bucket, Key=key, Body=body)


async def popen_wait(cmd):
    p = subprocess.Popen(cmd)
    # ruleid: guardian-blocking-call-in-async-code
    p.wait()


async def ok_async(cmd):
    # ok: guardian-blocking-call-in-async-code
    proc = await asyncio.create_subprocess_exec(*cmd)
    # ok: guardian-blocking-call-in-async-code
    await asyncio.sleep(1)
    # ok: guardian-blocking-call-in-async-code
    await asyncio.to_thread(subprocess.run, cmd)
    loop = asyncio.get_running_loop()
    # ok: guardian-blocking-call-in-async-code
    await loop.run_in_executor(None, lambda: subprocess.run(cmd))
    async with httpx.AsyncClient() as client:
        # ok: guardian-blocking-call-in-async-code
        await client.get("https://example.com")

    def helper():
        # ok: guardian-blocking-call-in-async-code
        return subprocess.run(cmd)

    return await asyncio.to_thread(helper)


def sync_is_fine(cmd):
    # ok: guardian-blocking-call-in-async-code
    subprocess.run(cmd)
    # ok: guardian-blocking-call-in-async-code
    time.sleep(1)
