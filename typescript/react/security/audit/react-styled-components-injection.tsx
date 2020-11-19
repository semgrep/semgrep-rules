import styled from "styled-components";

function Vulnerable1(userInput) {
  const ArbitraryComponent = styled.div`
// ruleid: react-styled-components-injection
    background: url(${userInput});
      /* More styles here... */
  `
  return ArbitraryComponent
}

function Vulnerable2(userInput) {
  const input = fooBar(userInput)

  return styled.div`
// ruleid: react-styled-components-injection
    background: url(${input});
      /* More styles here... */
  `
}

/*
 * TODO:
 *
 *    - pattern-inside: |
        function $FUNC(...,{$INPUT},...) {
          ...
          $STYLE = <... $INPUT ...>;
          ...
        }
    - pattern-inside: |
        function $FUNC(...,$INPUT,...) {
          ...
          $STYLE = <... $INPUT ...>;
          ...
        }
 *
 * function Vulnerable3(nevermind, {userInput}) {
  const input = '#' + userInput;

  return styled.div`
    background: ${input};
      /* More styles here... */
  `
}*/

function OkTest({siteUrl, input}) {

  const ArbitraryComponent = styled.div`
// ok: react-styled-components-injection
    background: red;
      /* More styles here... */
  `
  return ArbitraryComponent
}

function OkTest(input) {
  const css = 'red';

  const ArbitraryComponent = styled.div`
// ok: react-styled-components-injection
    background: ${css};
      /* More styles here... */
  `
  return ArbitraryComponent
}
