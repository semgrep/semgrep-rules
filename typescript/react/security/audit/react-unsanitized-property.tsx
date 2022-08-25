function Test2(input) {
  // ruleid: react-unsanitized-property
    ReactDOM.findDOMNode(this.someRef).outerHTML = input.value;
  }
  
  function OkTest1() {
  // ok: react-unsanitized-property
    this.element.innerHTML = "<a href='/about.html'>About</a>";
  }
  
  function OkTest2() {
  // ok: react-unsanitized-property
    ReactDOM.findDOMNode(this.someRef).outerHTML = "<a href='/about.html'>About</a>";
  }
  