#!/bin/bash

# ruleid: hooks-relative-script-path-bash
source ./scripts/validate.sh

# ruleid: hooks-relative-script-path-bash
bash ./hooks/check.sh

# ruleid: hooks-relative-script-path-bash
sh ./run.sh

# ok: hooks-relative-script-path-bash
source /usr/local/hooks/validate.sh

# ok: hooks-relative-script-path-bash
bash "$CLAUDE_PROJECT_DIR/hooks/check.sh"

# ok: hooks-relative-script-path-bash
source "$HOME/.claude/hooks/hook.sh"

# ok: hooks-relative-script-path-bash
bash "$CURSOR_PROJECT_DIR/hooks/check.sh"
