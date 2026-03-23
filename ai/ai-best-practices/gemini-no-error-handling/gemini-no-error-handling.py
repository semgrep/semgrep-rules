import google.generativeai as genai

model = genai.GenerativeModel("gemini-pro")

# ruleid: gemini-no-error-handling
response = model.generate_content("Hello")

def no_try():
    # ruleid: gemini-no-error-handling
    response = model.generate_content("Tell me a story")
    return response.text

# ok: gemini-no-error-handling
try:
    response = model.generate_content("Hello")
except Exception as e:
    handle_error(e)

def with_try():
    try:
        # ok: gemini-no-error-handling
        response = model.generate_content("Hello")
    except Exception as e:
        handle_error(e)
