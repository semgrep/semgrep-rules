#!/bin/bash

scrpt=$(curl -L https://raw.githubusercontent.com/something)
echo scrpt
# ruleid: curl-eval
eval ${scrpt}

# ruleid: curl-eval
eval $(curl -L https://raw.githubusercontent.com/something)

# ok: curl-eval
eval "x=1"
