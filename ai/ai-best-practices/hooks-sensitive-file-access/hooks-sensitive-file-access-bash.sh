#!/bin/bash

# ruleid: hooks-sensitive-file-access-bash
FILE_PATH=$(cat /dev/stdin | jq -r '.file_path')
cat $FILE_PATH

# ruleid: hooks-sensitive-file-access-bash
TARGET=$(cat /dev/stdin | jq -r '.path')
rm $TARGET

# ok: hooks-sensitive-file-access-bash
SAFE="hardcoded_file.txt"
cat $SAFE
