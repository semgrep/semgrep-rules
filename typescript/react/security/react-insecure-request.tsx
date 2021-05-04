import axios from 'axios';

// ruleid: react-insecure-request
fetch('http://www.example.com', 'GET', {})

let addr = "http://www.example.com"
// ruleid: react-insecure-request
fetch(addr, 'POST', {})

// ruleid: react-insecure-request
axios.get('http://www.example.com');

// ruleid: react-insecure-request
const options = {
  method: 'POST',
  headers: { 'content-type': 'application/x-www-form-urlencoded' },
  data: qs.stringify(data),
  url: 'http://www.example.com',
};
axios(options);

// ruleid: react-insecure-request
axios({ method: 'POST', url: 'http://www.example.com' });

// ok: react-insecure-request
fetch('https://www.example.com', 'GET', {})

// ok: react-insecure-request
axios.get('https://www.example.com');

// ok: react-insecure-request
const options = {
  method: 'POST',
  url: 'https://www.example.com',
};
axios(options);
