#!/bin/bash

FILE_PATH=$(cat /dev/stdin | jq -r '.file_path')
# ruleid: hooks-path-traversal-bash
cat $FILE_PATH

TARGET=$(echo "$INPUT" | jq -r '.path')
# ruleid: hooks-path-traversal-bash
rm $TARGET

# realpath alone does not validate: the resolved path may still escape the base dir
RAW_PATH=$(cat /dev/stdin | jq -r '.file_path')
SAFE_PATH=$(realpath "$RAW_PATH")
# ruleid: hooks-path-traversal-bash
cat $SAFE_PATH

# readlink -f alone does not validate either
RAW_PATH_RL=$(cat /dev/stdin | jq -r '.file_path')
SAFE_PATH_RL=$(readlink -f "$RAW_PATH_RL")
# ruleid: hooks-path-traversal-bash
rm "$SAFE_PATH_RL"

# ok: hooks-path-traversal-bash
GUARDED_RAW=$(cat /dev/stdin | jq -r '.file_path')
GUARDED_SAFE=$(realpath "$GUARDED_RAW")
if [[ $GUARDED_SAFE == $BASE_DIR/* ]]; then
  cat "$GUARDED_SAFE"
fi

# ok: hooks-path-traversal-bash
GUARD_EXIT_RAW=$(cat /dev/stdin | jq -r '.file_path')
GUARD_EXIT_SAFE=$(readlink -f "$GUARD_EXIT_RAW")
if [[ $GUARD_EXIT_SAFE != $BASE_DIR/* ]]; then
  echo "path escapes base dir" >&2
  exit 1
fi
cat "$GUARD_EXIT_SAFE"

# ok: hooks-path-traversal-bash
cat /tmp/known_file.txt
