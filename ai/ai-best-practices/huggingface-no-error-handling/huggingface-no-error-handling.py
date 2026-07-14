from huggingface_hub import InferenceClient

client = InferenceClient()

# ruleid: huggingface-no-error-handling
response = client.chat_completion(
    messages=[{"role": "user", "content": "Hello"}],
    model="meta-llama/Meta-Llama-3-8B-Instruct"
)

# ruleid: huggingface-no-error-handling
output = client.text_generation(
    "The answer to life is",
    model="meta-llama/Meta-Llama-3-8B-Instruct"
)

# ok: huggingface-no-error-handling
try:
    response = client.chat_completion(
        messages=[{"role": "user", "content": "Hello"}],
        model="meta-llama/Meta-Llama-3-8B-Instruct"
    )
except Exception as e:
    handle_error(e)

# ok: huggingface-no-error-handling
try:
    output = client.text_generation(
        "The answer to life is",
        model="meta-llama/Meta-Llama-3-8B-Instruct"
    )
except Exception as e:
    handle_error(e)
