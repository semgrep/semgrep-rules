function Test1(props) {
// ok: react-html-element-spreading
  const el = < div {...props} >123</div>;
  return el;
}

function Test1(props) {
// ok: react-html-element-spreading
  const el = <a {...props} >123</a>;
  return el;
}

function OkTest1(props) {
// ok: react-html-element-spreading
  const el = <MyCustomComponent {...props} some_other_prop={some_other_prop} />;
  return el;
}

function OkTest2(props, otherProps) {
  const {src, alt} = props;
  const {one_prop, two_prop} = otherProps;
// ok: react-html-element-spreading
  return <a one_prop={one_prop} two_prop={two_prop}>123</div>;
}
