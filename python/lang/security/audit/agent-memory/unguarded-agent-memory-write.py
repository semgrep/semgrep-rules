# Test cases for unguarded-agent-memory-write
# Run: semgrep --test

def store_tool_output(agent_memory, tool_response):
    # ruleid: unguarded-agent-memory-write
    agent_memory["session.context"] = tool_response


def merge_scratchpad(scratchpad, updates):
    # ruleid: unguarded-agent-memory-write
    scratchpad.update(updates)


def init_state(state, key, default):
    # ruleid: unguarded-agent-memory-write
    state.setdefault(key, default)


def store_config(settings, key, value):
    # ok: unguarded-agent-memory-write
    settings[key] = value


def store_guarded(guard, agent_memory, key, value):
    guard.write(key, value)
    # ok: unguarded-agent-memory-write
    agent_memory[key] = value
