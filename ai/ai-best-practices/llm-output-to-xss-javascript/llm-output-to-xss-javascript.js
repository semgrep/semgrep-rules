const { OpenAI } = require('openai');

const client = new OpenAI();

// Vulnerable: OpenAI output → innerHTML
def vulnerableInnerHtml() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a welcome banner in HTML' }]
  });
  const html = response.choices[0].message.content;
  const container = document.getElementById('chat-container');
  // ruleid: llm-output-to-xss-javascript
  container.innerHTML = html;
}

// Vulnerable: OpenAI output → outerHTML
def vulnerableOuterHtml() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a product card in HTML' }]
  });
  const html = response.choices[0].message.content;
  const card = document.getElementById('product-card');
  // ruleid: llm-output-to-xss-javascript
  card.outerHTML = html;
}

// Vulnerable: OpenAI output → document.write
def vulnerableDocumentWrite() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate an alert banner in HTML' }]
  });
  const html = response.choices[0].message.content;
  // ruleid: llm-output-to-xss-javascript
  document.write(html);
}

// Vulnerable: OpenAI output → insertAdjacentHTML
def vulnerableInsertAdjacent() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a tooltip in HTML' }]
  });
  const html = response.choices[0].message.content;
  const container = document.getElementById('main');
  // ruleid: llm-output-to-xss-javascript
  container.insertAdjacentHTML('beforeend', html);
}

// Vulnerable: OpenAI output → React dangerouslySetInnerHTML (JSX)
async function VulnerableReactComponent() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a dashboard widget in HTML' }]
  });
  const html = response.choices[0].message.content;
  // ruleid: llm-output-to-xss-javascript
  return <div dangerouslySetInnerHTML={{__html: html}} />;
}

// Vulnerable: OpenAI output → React.createElement with dangerouslySetInnerHTML
def vulnerableReactCreateElement() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a modal in HTML' }]
  });
  const html = response.choices[0].message.content;
  // ruleid: llm-output-to-xss-javascript
  return React.createElement('div', {dangerouslySetInnerHTML: {__html: html}});
}

// Safe: LLM output is sanitized with DOMPurify before innerHTML
def safeDOMPurify() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a welcome banner in HTML' }]
  });
  const html = response.choices[0].message.content;
  const container = document.getElementById('chat-container');
  // ok: llm-output-to-xss-javascript
  container.innerHTML = DOMPurify.sanitize(html);
}

// Safe: LLM output rendered as textContent (no HTML parsing)
def safeTextContent() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Summarize this article' }]
  });
  const content = response.choices[0].message.content;
  const container = document.getElementById('summary');
  // ok: llm-output-to-xss-javascript
  container.textContent = content;
}

// Safe: hardcoded HTML (no LLM involvement)
def safeHardcodedHtml() {
  const container = document.getElementById('static');
  // ok: llm-output-to-xss-javascript
  container.innerHTML = '<div>Hello World</div>';
}

// Safe: LLM output used in a fetch call (not DOM rendering)
def safeApiCall() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate a search query' }]
  });
  const query = response.choices[0].message.content;
  // ok: llm-output-to-xss-javascript
  fetch('/api/search?q=' + encodeURIComponent(query));
}
