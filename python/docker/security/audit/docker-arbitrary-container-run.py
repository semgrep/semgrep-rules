import docker
client = docker.from_env()

def bad1(user_input):
    # ruleid: docker-arbitrary-container-run
    client.containers.run(user_input, 'echo hello world')

def bad2(user_input):
    # ruleid: docker-arbitrary-container-run
    client.containers.create(user_input, 'echo hello world')

def ok1():
    # ok: docker-arbitrary-container-run
    client.containers.run("alpine", 'echo hello world')

def ok2():
    # ok: docker-arbitrary-container-run
    client.containers.create("alpine", 'echo hello world')
