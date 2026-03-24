#!/bin/bash

# --- Taint rule tests: stdin flows to dangerous sinks ---

TOOL=$(cat | jq -r '.tool_name')
# ruleid: hooks-unquoted-variable-bash-taint
bash -c $TOOL

CMD=$(cat | jq -r '.command')
# ruleid: hooks-unquoted-variable-bash-taint
sh -c $CMD

SCRIPT=$(cat | jq -r '.script')
# ruleid: hooks-unquoted-variable-bash-taint
source $SCRIPT

DATA=$(cat)
# ruleid: hooks-unquoted-variable-bash-taint
exec $DATA

# --- Eval pattern rule tests ---

# ruleid: hooks-unquoted-variable-bash-eval
eval $MY_VAR

# ruleid: hooks-unquoted-variable-bash-eval
eval $CMD_STRING extra args

# --- Safe patterns ---

# ok: hooks-unquoted-variable-bash-taint
# ok: hooks-unquoted-variable-bash-eval
SAFE="echo hello"
bash -c "$SAFE"

# ok: hooks-unquoted-variable-bash-taint
# ok: hooks-unquoted-variable-bash-eval
TOOL_NAME="grep"
"$TOOL_NAME" -r "pattern" .
