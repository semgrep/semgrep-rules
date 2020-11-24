function Vulnerable1(input) {
    return (
        <SuperDiv>
// ruleid: react-css-injection
            <div style={input}>
                    Hello world
            </div>
        </SuperDiv>
    );
}

function Vulnerable3() {
    const input = loadUserInput();
    return (
        <SuperDiv>
// ruleid: react-css-injection
            <div style={input}>
                    Hello world
            </div>
        </SuperDiv>
    );
}

function OkTest({siteUrl, input}) {
    return (
        <SuperDiv>
// ok: react-css-injection
            <div style={{color: input}}>
                    Hello world
            </div>
        </SuperDiv>
    );
}

function OkTest(input) {
    let styles = {color: input};
    return (
        <SuperDiv>
// ok: react-css-injection
            <div style={styles}>
                    Hello world
            </div>
        </SuperDiv>
    );
}
