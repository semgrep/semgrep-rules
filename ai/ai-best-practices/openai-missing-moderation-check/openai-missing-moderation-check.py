from openai import OpenAI

client = OpenAI()

def no_flagged_check():
    moderation = client.moderations.create(input="some text")
    # ruleid: openai-missing-moderation-check
    cats = moderation.results[0].categories
    return cats

def no_flagged_check_scores():
    moderation = client.moderations.create(input="some text")
    # ruleid: openai-missing-moderation-check
    scores = moderation.results[0].category_scores
    return scores

def with_flagged_check():
    moderation = client.moderations.create(input="some text")
    if moderation.results[0].flagged:
        return "Content flagged"
    # ok: openai-missing-moderation-check
    cats = moderation.results[0].categories
    return cats

def with_flagged_bool_check():
    moderation = client.moderations.create(input="some text")
    if moderation.results[0].flagged == True:
        return "Content flagged"
    # ok: openai-missing-moderation-check
    cats = moderation.results[0].categories
    return cats
