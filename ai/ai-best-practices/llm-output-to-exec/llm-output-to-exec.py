from openai import OpenAI
import subprocess, os

client = OpenAI()

def vulnerable_eval():
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "generate code"}])
    code = response.choices[0].message.content
    # ruleid: llm-output-to-exec-python
    eval(code)

def vulnerable_exec():
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "generate code"}])
    code = response.choices[0].message.content
    # ruleid: llm-output-to-exec-python
    exec(code)

def vulnerable_subprocess():
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "run command"}])
    cmd = response.choices[0].message.content
    # ruleid: llm-output-to-exec-python
    subprocess.run(cmd, shell=True)

def vulnerable_os_system():
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "run command"}])
    cmd = response.choices[0].message.content
    # ruleid: llm-output-to-exec-python
    os.system(cmd)

def safe_no_exec():
    response = client.chat.completions.create(model="gpt-4", messages=[{"role": "user", "content": "Hello"}])
    # ok: llm-output-to-exec-python
    content = response.choices[0].message.content
    print(content)

def safe_hardcoded():
    # ok: llm-output-to-exec-python
    subprocess.run(["ls", "-la"], shell=False)
