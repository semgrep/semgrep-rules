import DOMPurify from "dompurify"
import sanitize from "xss"

function TestComponent1() {
    // ok:react-dangerouslysetinnerhtml
  return <div dangerouslySetInnerHTML={createMarkup()} />;
}

function TestComponent2(foo) {
    // ruleid:react-dangerouslysetinnerhtml
    let params = {smth: 'test123', dangerouslySetInnerHTML: {__html: foo.bar}};
    return React.createElement('div', params);
}
export default function AdDisplay(props) {
  const { ad, className, shape = 'auto' } = props;
    let f = {smth: 'test123', dangerouslySetInnerHTML: {__html: props.bar}}
}

function TestComponent3() {
    // ok:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={{__html: params}} />;
}


function OkComponent1() {
    // ok:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={{__html: DOMPurify.sanitize(foo)}} />;
}


export default function AdDisplay(props) {
  const { ad, className, shape = 'auto' } = props;

  return (
    // ok: react-dangerouslysetinnerhtml
    <Root dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(props.description) }}>
    </Root>
  );
}


function OkComponent3() {
    // ok:react-dangerouslysetinnerhtml
    let params = {smth: 'test123', dangerouslySetInnerHTML: {__html: sanitize(foo)},a:b};
    return React.createElement('div', params);
}

function OkComponent4() {
    // ok:react-dangerouslysetinnerhtml
    let params = {smth: 'test123', dangerouslySetInnerHTML: {__html: "hi"},a:b};
    return React.createElement('div', params);
}

function OkComponent5() {
    // ok:react-dangerouslysetinnerhtml
  return <li class="foobar" selected={true} />;
}

function OkComponent6() {
    // ok:react-dangerouslysetinnerhtml
    let params = {smth: "test123", style: {color: 'red'}};
    return React.createElement('div', params);
}

export default function AdDisplay(props) {
  const { ad, className, shape = 'auto' } = props;

  return (
    // ruleid: react-dangerouslysetinnerhtml
    <Root dangerouslySetInnerHTML={{ __html: props.description }}>
    </Root>
  );
}


