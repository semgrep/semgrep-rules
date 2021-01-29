
function ok1() {
// ok: insecure-createnodesfrommarkup
  createNodesFromMarkup('<div></div', function () {
    handleIt();
  })
}

function bad1(input) {
// ruleid: insecure-createnodesfrommarkup
  createNodesFromMarkup('<div>' + input + '</div', function () {
    handleIt();
  })
}
