import styled from "styled-components";

function Vulnerable1(userInput) {
  const ArbitraryComponent = styled.div`
    background: url(${
      // ok: react-styled-components-injection
      userInput
    });
  `
  return ArbitraryComponent
}

function Vulnerable2(userInput) {
  const input = fooBar(userInput)

  return styled.div`
    background: url(${
      // ok: react-styled-components-injection
      input
    });
  `
}

function Vulnerable3(nevermind, {userInput}) {
  const input = '#' + userInput;

  return styled.div`
    background: ${
      // ok: react-styled-components-injection
      input
    };
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
