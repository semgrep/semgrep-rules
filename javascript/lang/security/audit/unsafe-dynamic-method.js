function test1(data) {
  const message = JSON.parse(data);
  // ruleid:unsafe-dynamic-method
  window[message.name](message.payload);
}

function test2(data) {
  const message = JSON.parse(data);
  // ruleid:unsafe-dynamic-method
  const action = window[message.name];
  action(message.payload);
}

let api = {
  foo: function () { /* do smth */ },
  bar: function () { /* do smth */ }
}

function okTest1(data) {
  const message = JSON.parse(data);
  if (!api.hasOwnProperty(message.name)) {
    return;
  }
  // ok:unsafe-dynamic-method
  api[message.name](message.payload);
}

function okTest2(data) {
  // ok:unsafe-dynamic-method
  const result = api["foo"](data);
  console.log(result);
}

function okTest3(data) {
  // ok:unsafe-dynamic-method
  const result = actions[1](data);
  console.log(result);
}

function okTest4(data) {
  const actions = api = {
    foo: function () { /* do smth */ },
    bar: function () { /* do smth */ }
  }
  let result = null
  Object.keys(actions).forEach(a => {
    // ok:unsafe-dynamic-method
    result = actions[a](result);
  })
  console.log(result);
}
