class Test1 extends React.Component {
  state = {
    value: ''
  };
// ruleid: react-legacy-component
  componentWillReceiveProps(nextProps) {
    this.setState({ value: nextProps.value });
  }
  handleChange = (e) => {
    this.setState({ value: e.target.value });
  };
  render() {
    return (
      <input
        value={this.state.value}
        onChange={this.handleChange}
      />
    );
  }
}

class OkComponent1 extends Component {
// ok: react-legacy-component
  componentDidMount() {
    this.node.scrollIntoView();
  }

  render() {
    return <div ref={node => this.node = node} />
  }
}
