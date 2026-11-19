// ruleid: insufficient-postmessage-origin-validation
window.addEventListener("message", function (evt) {
  console.log('Inline without origin check!');
});

function oldHandler(evt) {
  console.log('Normal function handler without origin check!');
};

// ruleid: insufficient-postmessage-origin-validation
window.addEventListener("message", oldHandler, false);

// ruleid: insufficient-postmessage-origin-validation
window.addEventListener('message', (evt) => {
  console.log('Inline arrow function without origin check!');
});

// ruleid: insufficient-postmessage-origin-validation
window.addEventListener('message', evt => {
  console.log('Inline arrow function without parenthesis & origin check!');
});

const handler = (evt) => {
  console.log('Arrow function handler without origin check!');
};

// ruleid: insufficient-postmessage-origin-validation
window.addEventListener("message", handler, false);

// ok: insufficient-postmessage-origin-validation
window.addEventListener("message", function (evt) {
  if (evt.origin == "http://example.com") {
    console.log('Normal inline function declaration with origin validation');
  }
});

// ok: insufficient-postmessage-origin-validation
function normalHandler(evt) {
  if (evt.origin == "http://example.com") {
    console.log('Normal function handler with origin validation');
  }
};

window.addEventListener('message', normalHandler, false);

// ok: insufficient-postmessage-origin-validation
window.addEventListener('message', (evt) => {
  if (evt.origin !== "http://example.com") {
    console.log('Inline arrow function declaration with origin validation');
  }
});

// ok: insufficient-postmessage-origin-validation
const arrowHandler = (evt) => {
  if (evt.origin == "http://example.com") {
    console.log('Arrow function handler with origin validation');
  }
};

window.addEventListener('message', arrowHandler, false);

const globalRegex = RegExp('/^http://www\.example\.com$/', 'g');

// ok: insufficient-postmessage-origin-validation
window.addEventListener("message", (evt) => {
  if (globalRegex.test(evt.origin)) {
    console.log(message.data);
  }
});

// ruleid: insufficient-postmessage-origin-validation
window.onmessage = function (evt) {
  console.log('onmessage inline function without origin check!');
};

// ruleid: insufficient-postmessage-origin-validation
window.onmessage = (evt) => {
  console.log('onmessage inline arrow function without origin check!');
};

function onmessageHandler(evt) {
  console.log('onmessage named handler without origin check!');
}

// ruleid: insufficient-postmessage-origin-validation
window.onmessage = onmessageHandler;

// ok: insufficient-postmessage-origin-validation
window.onmessage = function (evt) {
  if (evt.origin !== "http://example.com") {
    return;
  }
  console.log('onmessage inline function with origin validation');
};

// ok: insufficient-postmessage-origin-validation
window.onmessage = (evt) => {
  if (evt.origin === "http://example.com") {
    console.log('onmessage arrow function with origin validation');
  }
};

function checkedOnmessageHandler(evt) {
  if (evt.origin == "http://example.com") {
    console.log('onmessage named handler with origin validation');
  }
}

// ok: insufficient-postmessage-origin-validation
window.onmessage = checkedOnmessageHandler;

const worker = new Worker('worker.js');
// ok: insufficient-postmessage-origin-validation
worker.onmessage = function (evt) {
  console.log('Worker messages have no origin; not a window message handler');
};
