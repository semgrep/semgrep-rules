// ok: react-href-var
const a = <a className={"foobar"} href={"http://www.example.com"}></a>;
// ok: react-href-var
const b = <a className={"foobar"} href="http://www.example.com"></a>;

// ok: react-href-var
let x = <a className={"foobar"} href={input}></a>;

// ok: react-href-var
let zzz = <Foo className={"foobar"} href={input} />;

function test1(input) {
// ok: react-href-var
  const params = {href: input};
  return React.createElement("a", params);
}

function okTest1() {
// ok: react-href-var
  return React.createElement("a", {href: "https://www.example.com"});
}
