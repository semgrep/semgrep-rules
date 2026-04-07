#!/bin/bash

FILE_PATH=$(cat /dev/stdin | jq -r '.file_path')
# ruleid: hooks-path-traversal-bash
cat $FILE_PATH

TARGET=$(echo "$INPUT" | jq -r '.path')
# ruleid: hooks-path-traversal-bash
rm $TARGET

# ok: hooks-path-traversal-bash
RAW_PATH=$(cat /dev/stdin | jq -r '.file_path')
SAFE_PATH=$(realpath "$RAW_PATH")
cat $SAFE_PATH

# ok: hooks-path-traversal-bash
cat /tmp/known_file.txt
