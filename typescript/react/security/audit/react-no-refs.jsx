// ruleid: react-no-refs
const test1 = <div className="foo" ref={ this.someRef }></div>;
// ok: react-no-refs
const okTest = <div className="bar"></div>;

class MyComponent extends React.Component {
  constructor(props) {
    super(props);
// ruleid: react-no-refs
    this.myRef = React.createRef();
  }
  render() {
// ruleid: react-no-refs
    return <div ref={this.myRef} />;
  }
}

function CustomTextInput(props) {
// ruleid: react-no-refs
  const textInput = useRef(null);

  function handleClick() {
    textInput.current.focus();
  }

  return (
    <div>
// ruleid: react-no-refs
      <input
        type="text"
        ref={textInput} />
      <input
        type="button"
        value="Фокус на поле для ввода текста"
        onClick={handleClick}
      />
    </div>
  );
}
