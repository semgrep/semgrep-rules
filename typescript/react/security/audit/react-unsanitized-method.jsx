function Test1({input}) {
  // ruleid: react-unsanitized-method
    this.ref.insertAdjacentHTML('afterend', input.foo);
  }
  
  function Test2({input}) {
  // ruleid: react-unsanitized-method
    document.write(input.foo);
  }
  
  function Test3 () {
  // ok: react-unsanitized-method
    document.writeln(input);
  }
  
  function OkTest1 () {
  // ok: react-unsanitized-method
    this.ref.insertAdjacentHTML('afterend', '<div id="two">two</div>');
  }
  
  function OkTest2 () {
  // ok: react-unsanitized-method
    document.write("<h1>foobar</h1>");
  }
  
  function OkTest3 () {
  // ok: react-unsanitized-method
    document.writeln("<p>foobar</p>");
  }
  