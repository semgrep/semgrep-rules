# Test cases for unguarded-mem0-add
# Run: semgrep --test

def persist_memory(mem0_client, content, user_id):
    # ruleid: unguarded-mem0-add
    mem0_client.add(content, user_id=user_id)


def persist_generic_memory(memory, fact):
    # ruleid: unguarded-mem0-add
    memory.add(fact)


def collect(results, item):
    # ok: unguarded-mem0-add
    results.add(item)


def persist_guarded(guard, mem0_client, content, user_id):
    guard.write("mem0.entry", content, source="mem0")
    # ok: unguarded-mem0-add
    mem0_client.add(content, user_id=user_id)
