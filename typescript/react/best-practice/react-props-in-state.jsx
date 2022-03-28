class Test1 extends React.Component {
  constructor() {
    // ruleid:react-props-in-state
    this.state = {
          foo: 'bar',
          color: this.props.color,
          one: 1
    };
  }

  render() {
    const { color } = this.state;
    return (
      <button className={'Button-' + color}>
        {this.props.children}
      </button>
    );
  }
}

class Test2 extends React.Component {
  constructor() {
    // ruleid:react-props-in-state
    this.state = {
      textColor: slowlyCalculateTextColor(this.props.color)
    };
  }

  render() {
    return (
      <button className={
        'Button-' + this.props.color +
        ' Button-text-' + this.state.textColor
      }>
        {this.props.children}
      </button>
    );
  }
}

class OkTest extends React.Component {
// ok: react-props-in-state
  constructor() {
    this.state = {
          foo: 'bar',
          initialColor: this.props.color,
          one: 1
    };
  }

  render() {
    const { color } = this.state;
    return (
      <button className={'Button-' + color}>
        {this.props.children}
      </button>
    );
  }
}

function Test3({ text }) {
  // ruleid:react-props-in-state
  const [buttonText] = useState(text)
  return <button>{buttonText}</button>
}

function Test4(props) {
  // ruleid:react-props-in-state
  const [formattedText] = useState(() => slowlyFormatText(props.text))
  return <button>{formattedText}</button>
}

function OkTest1({ color, children }) {
  const textColor = useMemo(
// ok: react-props-in-state
    () => slowlyCalculateTextColor(color),
    [color]
  );
  return (
    <button className={'Button-' + color + ' Button-text-' + textColor}>
      {children}
    </button>
  );
}

class OkTest2 extends React.PureComponent {
  render() {
// ok: react-props-in-state
    const textColor = slowlyCalculateTextColor(this.props.color);
    return (
      <button className={
        'Button-' + this.props.color +
        ' Button-text-' + textColor
      }>
        {this.props.children}
      </button>
    );
  }
}
