from mistralai import Mistral

client = Mistral(api_key=os.environ["MISTRAL_API_KEY"])

def no_moderation():
    # ruleid: mistral-missing-moderation
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": user_input}]
    )
    return response

# ok: mistral-missing-moderation
def with_moderation():
    moderation = client.classifiers.moderate(
        model="mistral-moderation-latest",
        inputs=[user_input]
    )
    if any(r.categories for r in moderation.results):
        return "Content flagged"
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": user_input}]
    )
    return response

# ok: mistral-missing-moderation
def with_chat_moderation():
    moderation = client.classifiers.moderate_chat(
        model="mistral-moderation-latest",
        inputs=[{"role": "user", "content": user_input}]
    )
    response = client.chat.complete(
        model="mistral-large-latest",
        messages=[{"role": "user", "content": user_input}]
    )
    return response
