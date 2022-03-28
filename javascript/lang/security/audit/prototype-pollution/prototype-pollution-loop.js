function test1(name, value) {
  if (name.indexOf('.') === -1) {
    this.config[name] = value;
    return this;
  }
  let config = this.config;
  name = name.split('.');

  const length = name.length;
  name.forEach((item, index) => {
    if (index === length - 1) {
      config[item] = value;
    } else {
      if (!helper.isObject(config[item])) {
        config[item] = {};
      }
      // ruleid:prototype-pollution-loop
      config = config[item];
    }
  });
  return this;
}

function test2(obj, props, value) {
  if (typeof props == 'string') {
    props = props.split('.');
  }
  if (typeof props == 'symbol') {
    props = [props];
  }
  var lastProp = props.pop();
  if (!lastProp) {
    return false;
  }
  var thisProp;
  while ((thisProp = props.shift())) {
    if (typeof obj[thisProp] == 'undefined') {
      obj[thisProp] = {};
    }
    // ruleid:prototype-pollution-loop
    obj = obj[thisProp];
    if (!obj || typeof obj != 'object') {
      return false;
    }
  }
  obj[lastProp] = value;
  return true;
}

function test3(obj, prop, val) {
  const segs = split(prop);
  const last = segs.pop();
  while (segs.length) {
    const key = segs.shift();
    // ruleid:prototype-pollution-loop
    obj = obj[key] || (obj[key] = {});
  }
  obj[last] = val;
}

function okTest1(name) {
  if (name.indexOf('.') === -1) {
    this.config[name] = value;
    return this;
  }
  let config = this.config;
  name = name.split('.');

  const length = name.length;
  name.forEach((item, index) => {
    // ok:prototype-pollution-loop
    config = config[index];
  });
  return this;
}

function okTest2(name) {
  let config = this.config;
  name = name.split('.');

  const length = name.length;
  for (let i = 0; i < name.length; i++) {
    // ok:prototype-pollution-loop
    config = config[i];
  }
  return this;
}
