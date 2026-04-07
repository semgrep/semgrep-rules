from openai import OpenAI

client = OpenAI()

# ruleid: openai-no-error-handling
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Hello"}]
)

def no_try():
    # ruleid: openai-no-error-handling
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Hello"}]
    )
    return response

# ok: openai-no-error-handling
try:
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Hello"}]
    )
except Exception as e:
    handle_error(e)

def with_try():
    try:
        # ok: openai-no-error-handling
        response = client.chat.completions.create(
            model="gpt-4",
            messages=[{"role": "user", "content": "Hello"}]
        )
    except openai.RateLimitError as e:
        handle_rate_limit(e)
    except openai.APIError as e:
        handle_api_error(e)
