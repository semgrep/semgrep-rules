from openai import OpenAI

client = OpenAI()

def no_moderation():
    # ruleid: openai-missing-moderation
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_input}]
    )

def also_no_moderation(user_input):
    # ruleid: openai-missing-moderation
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are helpful"},
            {"role": "user", "content": user_input}
        ]
    )
    return response

def with_moderation():
    moderation = client.moderations.create(input=user_input)
    if moderation.results[0].flagged:
        return "Content flagged"
    # ok: openai-missing-moderation
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_input}]
    )

def with_moderation_after():
    # ok: openai-missing-moderation
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_input}]
    )
    moderation = client.moderations.create(input=response)
    return moderation
