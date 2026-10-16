const el = element.innerHTML;

function bad1(userInput) {
// ruleid: insecure-document-method
  el.innerHTML = '<div>' + userInput + '</div>';
}

function bad2(userInput) {
// ruleid: insecure-document-method
  document.body.outerHTML = userInput;
}

function bad3(userInput) {
  const name = '<div>' + userInput + '</div>';
// ruleid: insecure-document-method
  document.write(name);
}

function ok1() {
  const name = "<div>it's ok</div>";
// ok: insecure-document-method
  el.innerHTML = name;
}

function ok2() {
// ok: insecure-document-method
  document.write("<div>it's ok</div>");
}

// Preserve the distinct innerHTML cases from the retired rule's fixture.
function badInnerHtmlDirect(userInput) {
  // ruleid: insecure-document-method
  document.body.innerHTML = userInput;
}

function badInnerHtmlAlias(userInput) {
  const name = '<div>' + userInput + '</div>';
  // ruleid: insecure-document-method
  document.body.innerHTML = name;
}

function okInnerHtmlLiteral() {
  // ok: insecure-document-method
  document.body.innerHTML = "<div>it's ok</div>";
}
