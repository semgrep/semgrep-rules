from openai import OpenAI
from django.utils.safestring import mark_safe
from markupsafe import Markup

client = OpenAI()

# Vulnerable: OpenAI output → Django mark_safe (raw HTML rendering)
def vulnerable_openai_mark_safe():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Generate a welcome banner in HTML"}]
    )
    html = response.choices[0].message.content
    # ruleid: llm-output-to-xss-python
    return mark_safe(html)

# Vulnerable: Anthropic output → Markup (Flask/Jinja raw HTML)
def vulnerable_anthropic_markup():
    import anthropic
    client_anthropic = anthropic.Anthropic()
    response = client_anthropic.messages.create(
        model="claude-3-sonnet",
        max_tokens=1024,
        messages=[{"role": "user", "content": "Generate a product card in HTML"}]
    )
    html = response.content[0].text
    # ruleid: llm-output-to-xss-python
    return Markup(html)

# Vulnerable: Gemini output → mark_safe via concatenation
def vulnerable_gemini_concat():
    import google.generativeai as genai
    model = genai.GenerativeModel("gemini-pro")
    response = model.generate_content("Generate an alert message in HTML")
    html = response.text
    banner = "<div class='banner'>" + html + "</div>"
    # ruleid: llm-output-to-xss-python
    return mark_safe(banner)

# Vulnerable: direct response.content → mark_safe
def vulnerable_direct_content():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Generate HTML for a tooltip"}]
    )
    # ruleid: llm-output-to-xss-python
    return mark_safe(response.choices[0].message.content)

# Safe: LLM output is escaped before rendering
def safe_escaped_html():
    import html
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Generate a welcome banner in HTML"}]
    )
    raw_html = response.choices[0].message.content
    # ok: llm-output-to-xss-python
    escaped = html.escape(raw_html)
    return mark_safe(escaped)

# Safe: LLM output is used as text content (no HTML rendering)
def safe_text_content():
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Summarize this article"}]
    )
    content = response.choices[0].message.content
    # ok: llm-output-to-xss-python
    print(content)

# Safe: hardcoded HTML (no LLM involvement)
def safe_hardcoded_html():
    # ok: llm-output-to-xss-python
    return mark_safe("<div>Hello World</div>")

# Safe: LLM output passed to a JSON serializer (not HTML)
def safe_json_response():
    import json
    response = client.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": "Summarize this article"}]
    )
    content = response.choices[0].message.content
    # ok: llm-output-to-xss-python
    return json.dumps({"summary": content})
