const { OpenAI } = require('openai');
const mysql = require('mysql');

const client = new OpenAI();

// Vulnerable: OpenAI output -> direct MySQL query execution
async function vulnerableOpenAiSql() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate SQL to count users' }]
  });
  const sql = response.choices[0].message.content;
  const connection = mysql.createConnection({ host: 'localhost', user: 'root' });
  // ruleid: llm-output-to-sql-injection-javascript
  connection.query(sql);
}

// Vulnerable: OpenAI output -> direct query via pool
async function vulnerablePoolQuery() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'List all admins' }]
  });
  const sql = response.choices[0].message.content;
  const pool = mysql.createPool({ host: 'localhost', user: 'root' });
  // ruleid: llm-output-to-sql-injection-javascript
  pool.query(sql);
}

// Vulnerable: generic client.query sink
async function vulnerableClientQuery() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Show orders' }]
  });
  const sql = response.choices[0].message.content;
  const db = mysql.createConnection({ host: 'localhost' });
  // ruleid: llm-output-to-sql-injection-javascript
  db.query(sql);
}

// Vulnerable: response.content direct source
async function vulnerableContentDirect() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Generate report SQL' }]
  });
  const db = mysql.createConnection({ host: 'localhost' });
  // ruleid: llm-output-to-sql-injection-javascript
  db.query(response.choices[0].message.content);
}

// Safe: parameterized query with LLM-derived value as parameter
async function safeParameterized() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'What is the status of order 123?' }]
  });
  const userId = response.choices[0].message.content.trim();
  const connection = mysql.createConnection({ host: 'localhost', user: 'root' });
  // ok: llm-output-to-sql-injection-javascript
  connection.query('SELECT * FROM users WHERE id = ?', [userId]);
}

// Safe: LLM output is logged, not executed as SQL
async function safeNoSql() {
  const response = await client.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: 'Explain SQL injection' }]
  });
  const content = response.choices[0].message.content;
  // ok: llm-output-to-sql-injection-javascript
  console.log(content);
}

// Safe: hardcoded SQL (no LLM involvement)
async function safeHardcoded() {
  const connection = mysql.createConnection({ host: 'localhost', user: 'root' });
  // ok: llm-output-to-sql-injection-javascript
  connection.query('SELECT * FROM users WHERE active = 1');
}
