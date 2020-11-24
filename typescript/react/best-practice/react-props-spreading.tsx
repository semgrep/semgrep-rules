function Test1(props) {
// ruleid: react-props-spreading
    const el = <App {...props} />;
    return el;
}

function Test2(props) {
// ruleid: react-props-spreading
    const el = <MyCustomComponent {...props} some_other_prop={some_other_prop} />;
    return el;
}

function Test2(props, otherProps) {
    const {src, alt} = props;
    const {one_prop, two_prop} = otherProps;
// ok: react-props-spreading
    return <MyCustomComponent one_prop={one_prop} two_prop={two_prop} />;
}
