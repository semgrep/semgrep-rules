import something from "foobar";

const userInput = JSON.parse(storedValue);

function test1() {
  // ok: react-props-injection
  return <div className={"foo"} {...userInput} />;
}

function test2() {
  // ok: react-props-injection
  return <div className={"foo"} {...doSmth(userInput)} />;
}

function test3(input) {
  // ok: react-props-injection
  return <div className={"foo"} {...input} />;
}

function test4() {
  const input = JSON.parse(storedValue);
  // ok: react-props-injection
  return React.createElement("span", input);
}

function test5(input) {
  // ok: react-props-injection
  return React.createElement("span", doSmth(input));
}

function test6() {
  // ok: react-props-injection
  return <div className={"foo"} {...something} />;
}

function okTest1(input) {
  // ok: react-props-injection
  return <div className={"foo"} prop={input} />;
}

function okTest2() {
  const input = JSON.parse(storedValue);
  // ok: react-props-injection
  return React.createElement("span", {attr: input.attr});
}
