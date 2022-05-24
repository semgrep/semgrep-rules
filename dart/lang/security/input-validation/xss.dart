
// ok: dart-xss
factory NodeValidator({UriPolicy? uriPolicy}) =>
    new _Html5NodeValidator(uriPolicy: uriPolicy);

// ruleid: dart-xss
factory Element.html(String? html,
    {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
  var fragment = document.body!.createFragment(html,
      validator: validator, treeSanitizer: treeSanitizer);

  return fragment.nodes.where((e) => e is Element).single as Element;
}

// ok: dart-xss
Void setInnerHtml(String? html,
    {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
  text = null;
  if (treeSanitizer is _TrustedHtmlTreeSanitizer) {
    _innerHtml = html;
  } else {
    append(createFragment(html,
        validator: validator, treeSanitizer: treeSanitizer));
  }
}


// ok: dart-xss
void appendHtml(String text,
    {NodeValidator? validator, NodeTreeSanitizer? treeSanitizer}) {
  this.insertAdjacentHtml('beforeend', text,
      validator: validator, treeSanitizer: treeSanitizer);
}


var html = '<div class="something">content</div>';
var element = new Element.html('<div class="foo">content</div>');
// ok: dart-xss
document.body.insertAdjacentHtml('afterBegin', html);
// ruleid: dart-xss
document.body.insertAdjacentHtml('afterBegin', element);
var createdElement = document.body.children[0];
print(createdElement.classes[0]); 