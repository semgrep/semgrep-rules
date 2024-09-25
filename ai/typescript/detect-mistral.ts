// ruleid: detect-mistral
import MistralClient from '@mistralai/mistralai';

const apiKey = process.env.MISTRAL_API_KEY;

// ruleid: detect-mistral
const client = new MistralClient(apiKey);

// ruleid: detect-mistral
const chatResponse = await client.chat({
  messages: [{role: 'user', content: 'What is the best French cheese?'}],
  model: 'mistral-large-latest',
});

console.log('Chat:', chatResponse.choices[0].message.content);