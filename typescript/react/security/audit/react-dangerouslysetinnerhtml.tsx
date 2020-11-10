function createMarkup() {
  return {__html: 'Первый &middot; Второй'};
}

function TestComponent1() {
    // ruleid:react-dangerouslysetinnerhtml
  return <div dangerouslySetInnerHTML={createMarkup()} />;
}

function TestComponent2() {
    // ruleid:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={createMarkup()} />;
}

function TestComponent3() {
    // ruleid:react-dangerouslysetinnerhtml
    let params = {smth: 'test123', dangerouslySetInnerHTML: {__html: 'foobar'}};
    return React.createElement('div', params);
}

function OkComponent1() {
    // ok:react-dangerouslysetinnerhtml
  return <li class="foobar" selected={true} />;
}

function OkComponent2() {
    // ok:react-dangerouslysetinnerhtml
    let params = {smth: "test123", style: {color: 'red'}};
    return React.createElement('div', params);
}
