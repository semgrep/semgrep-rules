const el = element.innerHTML;

function bad1(userInput) {
  // ruleid: insecure-innerhtml
  el.innerHTML = '<div>' + userInput + '</div>';
}

function bad2(userInput) {
  // ruleid: insecure-innerhtml
  document.body.innerHTML = userInput;
}

function bad3(userInput) {
  const name = '<div>' + userInput + '</div>';
  // ruleid: insecure-innerhtml
  document.body.innerHTML = name;
}

function ok1() {
  const name = "<div>it's ok</div>";
  // ok: insecure-innerhtml
  el.innerHTML = name;
}

function ok2() {
  // ok: insecure-innerhtml
  document.body.innerHTML = "<div>it's ok</div>";
}
