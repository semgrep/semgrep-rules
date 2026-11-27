# Test cases for unguarded-langchain-history-append
# Run: semgrep --test

def record_user_turn(chat_history, text):
    # ruleid: unguarded-langchain-history-append
    chat_history.add_user_message(text)


def record_ai_turn(history, text):
    # ruleid: unguarded-langchain-history-append
    history.add_ai_message(text)


def record_message(message_history, msg):
    # ruleid: unguarded-langchain-history-append
    message_history.add_message(msg)


def enqueue(dispatcher, msg):
    # ok: unguarded-langchain-history-append
    dispatcher.add_message(msg)


def record_guarded(guard, chat_history, text):
    guard.write("turn", text, source="user")
    # ok: unguarded-langchain-history-append
    chat_history.add_user_message(text)
