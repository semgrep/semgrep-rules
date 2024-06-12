const rawRes = await fetchWithTimeout(
    // ruleid: detect-generic-ai-api
   `https://${baseURL}/v1/chat/completions`,
   {
     headers: {
       "Content-Type": "application/json",
       Authorization: `Bearer ${apiKey}`
     },
     timeout,
     method: "POST",
     body: JSON.stringify({
       model,
       messages: messages.map(k => ({ role: k.role, content: k.content })),
       temperature,
       stream: true
     })
   }
 )