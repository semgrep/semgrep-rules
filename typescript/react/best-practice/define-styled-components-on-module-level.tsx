import styled from "styled-components";

// ok: define-styled-components-on-module-level
const ArbitraryComponent = styled.div`
  color: blue;
`
// ok: define-styled-components-on-module-level
const ArbitraryComponent2 = styled(ArbitraryComponent)`
  color: blue;
`

function FunctionalComponent() {
  // ruleid: define-styled-components-on-module-level
  const ArbitraryComponent3 = styled.div`
    color: blue;
  `
  return <ArbitraryComponent3 />
}

function FunctionalComponent2() {
  // ruleid: define-styled-components-on-module-level
  const ArbitraryComponent3 = styled(FunctionalComponent)`
    color: blue;
  `
  return <ArbitraryComponent3 />
}

class ClassComponent {
  public render() {
    // ruleid: define-styled-components-on-module-level
    const ArbitraryComponent4 = styled.div`
        color: blue;
    `
    return <ArbitraryComponent4 />
  }
}
