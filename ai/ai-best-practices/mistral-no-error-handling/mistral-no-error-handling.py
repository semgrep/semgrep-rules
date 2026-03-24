from mistralai import Mistral

client = Mistral(api_key="key")

# ruleid: mistral-no-error-handling
response = client.chat.complete(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Hello"}]
)

# ruleid: mistral-no-error-handling
response = client.chat.stream(
    model="mistral-large-latest",
    messages=[{"role": "user", "content": "Hello"}]
)

def no_try():
    # ruleid: mistral-no-error-handling
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": "Hello"}]
    )
    return response

# ok: mistral-no-error-handling
try:
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": "Hello"}]
    )
except Exception as e:
    handle_error(e)

# ok: mistral-no-error-handling
try:
    response = client.chat.stream(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": "Hello"}]
    )
except Exception as e:
    handle_error(e)

def with_try():
    try:
        # ok: mistral-no-error-handling
        response = client.chat.complete(
            model="mistral-large-latest",
            messages=[{"role": "user", "content": "Hello"}]
        )
    except Exception as e:
        handle_error(e)
