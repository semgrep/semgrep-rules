import os

from fastapi import FastAPI
from huggingface_hub import InferenceClient
from langchain_core.messages import HumanMessage
from langchain_openai import ChatOpenAI
from openai import OpenAI

app = FastAPI()


@app.put("/prompt/{user_id}/{user_name}")
def prompt(user_id: int, user_name: str):
    safe_user_chat = f"ints are safe {user_id}"
    user_chat = f"ints are safe {user_name}"

    client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))
    client.chat.completions.create(
        # proruleid: prompt-injection-fastapi
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": user_chat},
        ],
        temperature=0,
    )

    client.chat.completions.create(
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": safe_user_chat},
        ],
        temperature=0,
    )

    huggingface = InferenceClient()
    # proruleid: prompt-injection-fastapi
    res = huggingface.text_generation(user_chat, stream=True, details=True)

    huggingface = InferenceClient()
    # proruleid: prompt-injection-fastapi
    res = huggingface.text_generation(user_chat, stream=True, details=True)

    chat = ChatOpenAI(model="gpt-3.5-turbo-1106", temperature=0.2)
    # proruleid: prompt-injection-fastapi
    chat.invoke([HumanMessage(content=user_chat)])
