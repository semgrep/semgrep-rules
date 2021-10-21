#!/bin/bash

# ruleid: curl-as-host
curl -LO "https://$(curl -L -s https://dl.k8s.io/release/host.txt)/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# ok: curl-as-host
curl -LO "https://dl.k8s.io/host.txt/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# ok: curl-as-host
curl -L https://example.com
