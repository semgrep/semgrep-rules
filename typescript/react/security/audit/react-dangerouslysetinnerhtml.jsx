import DOMPurify from "dompurify"
import sanitize from "xss"

function TestComponent1() {
    // ok:react-dangerouslysetinnerhtml
  return <div dangerouslySetInnerHTML={createMarkup()} />;
}

function TestComponent2(foo) {
    // ruleid:react-dangerouslysetinnerhtml
    let params = {smth: 'test123', dangerouslySetInnerHTML: {__html: foo.bar},a:b};
    return React.createElement('div', params);
}

// ok:react-dangerouslysetinnerhtml
{collaborationSectionData.paragraphs.map((item, i) => (
  <li key={`collaboration-p-${i}`} dangerouslySetInnerHTML={{
    __html: item,}}>
  </li>
))}

function TestComponent3() {
    // ok:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={{__html: params}} />;
}


function OkComponent1() {
    // ok:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={{__html: DOMPurify.sanitize(foo)}} />;
}



function OkComponent2() {
    // ok:react-dangerouslysetinnerhtml
  return <li className={"foobar"} dangerouslySetInnerHTML={DOMPurify.sanitize(createMarkup())} />;
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
