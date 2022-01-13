#!/bin/bash

x=$(curl -L https://raw.githubusercontent.com/something)
# ruleid: curl-eval
eval ${x}

yy=`curl $SOME_URL`
eval yy
# ruleid: curl-eval
eval ${yy}

scrpt=$(curl -L https://raw.githubusercontent.com/something)
echo scrpt
scrpt2=$( ${scrpt} | tr -d 1 )
# ruleid: curl-eval
eval ${scrpt2}

# ruleid: curl-eval
eval $(curl -L https://raw.githubusercontent.com/something)

# ok: curl-eval
eval "x=1"

