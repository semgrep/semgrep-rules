# Test cases for unguarded-autogen-history-append
# Run: semgrep --test

def append_turn(chat_history, msg):
    # ruleid: unguarded-autogen-history-append
    chat_history.append(msg)


def append_agent_message(conversation, msg):
    # ruleid: unguarded-autogen-history-append
    conversation.append(msg)


def append_result(results, item):
    # ok: unguarded-autogen-history-append
    results.append(item)


def append_guarded(guard, history, msg):
    guard.write("msg.next", msg["content"], source=msg["role"])
    # ok: unguarded-autogen-history-append
    history.append(msg)
