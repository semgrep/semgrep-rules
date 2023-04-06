import {
  SEMGREP_REPO,
} from "../../util";

import SEMGREP_REPO1 from "../../util1";

// ok: react-href-var
let zzz = <Foo className={"foobar"} href={getQuery()} />;

function test1(input) {
// ruleid: react-href-var
  const params = {href: input.a};
  return React.createElement("a", params);
}

// ok: react-href-var
{collaborationSectionData.paragraphs.map((item, i) => (
  <div>  <a href={item.value}>click</a></div>
))}

// ok: react-href-var
let zzz = <Foo className={"foobar"} href={`${input}`} />;

// ok: react-href-var
let zzz = <Foo className={"foobar"} href={SEMGREP_REPO} />;

// ok: react-href-var
let zzz = <Foo className={"foobar"} href={SEMGREP_REPO1} />;

function test1(input) {
// ok: react-href-var
  if(input.startsWith("https:")) {
    const params = {href: input};
    return React.createElement("a", params);
  }
}

function test2(input) {
  // ok: react-href-var
  const params = {href: "#"+input};
  return React.createElement("a", params);
}

function test2(input) {
  // ok: react-href-var
  const params = {href: "#"+input};
  return React.createElement("a", params);
}


// ok: react-href-var
const b = <a className={"foobar"} href={"http://www.example.com"}></a>;

// ok: react-href-var
let x = <a className={"foobar"} href={"#"+input}></a>;

// ok: react-href-var
let x = <a className={"foobar"} href={`#${input}`}></a>;

function okTest1() {
// ok: react-href-var
  return React.createElement("a", {href: "https://www.example.com"});
}