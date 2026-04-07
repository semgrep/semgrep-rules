#!/bin/bash

# ruleid: hooks-no-input-validation-bash
eval $INPUT

# ruleid: hooks-no-input-validation-bash
eval "$RESULT"

# ruleid: hooks-no-input-validation-bash
echo $DATA | bash

# ruleid: hooks-no-input-validation-bash
echo $DATA | sh

# ok: hooks-no-input-validation-bash
if [ -n "$INPUT" ]; then
    echo "Input is not empty"
fi
