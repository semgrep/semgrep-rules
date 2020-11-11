// ruleid: react-no-refs
const test1 = <div className="foo" ref={ this.someRef }></div>;
// ok: react-no-refs
const okTest = <div className="bar"></div>;
