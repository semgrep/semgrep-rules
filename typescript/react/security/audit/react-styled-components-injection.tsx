import styled, { keyframes } from "styled-components";

function Vulnerable1(userInput) {
// ruleid: react-styled-components-injection
  const ArbitraryComponent = styled.div`
    background: url(${userInput});
  `
  return ArbitraryComponent
}

function Vulnerable2(userInput) {
  const input = fooBar(userInput)

// ruleid: react-styled-components-injection
  return styled.div`
    background: url(${input});
  `
}

function Vulnerable3(nevermind, {userInput}) {
  const input = '#' + userInput;

// ruleid: react-styled-components-injection
  return styled.div`
    background: ${input};
  `
}

function OkTest({siteUrl, input}) {
// ok: react-styled-components-injection
  const ArbitraryComponent = styled.div`
    background: red;
  `
  return ArbitraryComponent
}

function OkTest(input) {
  const css = 'red';
// ok: react-styled-components-injection
  const ArbitraryComponent = styled.div`
    background: ${css};
  `
  return ArbitraryComponent
}

function OkTest(input) {
  const css = "red";
  const anim = keyframes`from {width: 1;} to {width: 2;}`;
  // ok: react-styled-components-injection
  const ArbitraryComponent = styled.div`
    animation: ${anim};
  `;
  return ArbitraryComponent;
}
