from paramiko import client

ssh_client = client.SSHClient()
# ruleid:paramiko-implicit-trust-host-key
ssh_client.set_missing_host_key_policy(client.AutoAddPolicy())
# ruleid:paramiko-implicit-trust-host-key
ssh_client.set_missing_host_key_policy(client.WarningPolicy())
# ok:paramiko-implicit-trust-host-key
ssh_client.set_missing_host_key_policy(client.RejectPolicy())


import paramiko

def top_level_exports():
    ssh = paramiko.SSHClient()
    # ruleid:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    # ruleid:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(paramiko.WarningPolicy())
    # ok:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(paramiko.RejectPolicy())

def imported_exports():
    from paramiko import SSHClient, AutoAddPolicy, WarningPolicy, RejectPolicy
    ssh = SSHClient()
    # ruleid:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(AutoAddPolicy())
    # ruleid:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(WarningPolicy())
    # ok:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(RejectPolicy())

def mixed_exports():
    ssh = paramiko.client.SSHClient()
    # ruleid:paramiko-implicit-trust-host-key
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    other = paramiko.SSHClient()
    # ruleid:paramiko-implicit-trust-host-key
    other.set_missing_host_key_policy(paramiko.client.WarningPolicy())

def policy_without_client_call():
    # ok:paramiko-implicit-trust-host-key
    policy = paramiko.AutoAddPolicy()
