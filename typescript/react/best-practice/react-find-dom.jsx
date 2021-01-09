class TestComponent1 extends Component {
  componentDidMount() {
        // ruleid: react-find-dom
    findDOMNode(this).scrollIntoView();
  }

  render() {
    return <div />
  }
}

class OkComponent1 extends Component {
  componentDidMount() {
        // ok: react-find-dom
    this.node.scrollIntoView();
  }

  render() {
    return <div ref={node => this.node = node} />
  }
}

class TestComponent1 extends Component {
  componentDidMount() {
        // ruleid: react-find-dom
    ReactDOM.findDOMNode(this.refs.something).scrollIntoView();
  }

  render() {
    return (
      <div>
        <div ref='something' />
      </div>
    )
  }
}

class OkComponent2 extends Component {
  componentDidMount() {
        // ok: react-find-dom
    this.something.scrollIntoView();
  }

  render() {
    return (
      <div>
        <div ref={node => this.something = node} />
      </div>
    )
  }
}
