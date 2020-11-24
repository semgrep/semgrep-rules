// ruleid: react-missing-noreferrer
var Test1 = <a target='_blank' href="http://example.com/"></a>

// ruleid: react-missing-noreferrer
var Test2 = <a target="_blank" rel='noopener' href="http://example.com"></a>

// ruleid: react-missing-noreferrer
var Test3 = <a rel='noopener' target="_blank" href="http://example.com"></a>

// ruleid: react-missing-noreferrer
var Test4 = <Link target="_blank" to="http://example.com/"></Link>

// ruleid: react-missing-noreferrer
var Test5 = <Link target="_blank" to={dynamicLink}></Link>

// ok: react-missing-noreferrer
var OkTest1 = <Link target="_blank" rel="noopener noreferrer" to="http://example.com"></Link>

// ok: react-missing-noreferrer
var OkTest2 = <a target="_blank" rel="noreferrer" href="http://example.com"></a>

// ok: react-missing-noreferrer
var OkTest3 = <a target="_blank" rel="noopener noreferrer" href="http://example.com"></a>

function TestComponent1() {
// ruleid: react-missing-noreferrer
  let params = {target: '_blank', href: 'http://example.com/'};
  return React.createElement('a', params);
}

function TestComponent2() {
// ruleid: react-missing-noreferrer
  return React.createElement('a', {target: '_blank', href: 'http://example.com/'});
}

function TestComponent3() {
// ruleid: react-missing-noreferrer
  return React.createElement('a', {target: '_blank', href: 'http://example.com/', rel: 'noopener'});
}

function OkComponent1() {
// ok: react-missing-noreferrer
  return React.createElement('a', {target: '_blank', href: 'http://example.com/', rel: "noopener noreferrer"});
}
