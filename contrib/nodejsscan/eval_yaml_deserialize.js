var untrusted_code = '"toString": !<tag:yaml.org,2002:js/function> "function (){very_evil_thing();}"';
var notneeded = 1;
// I'm just converting that string, what could possibly go wrong?
// ruleid:yaml_deserialize
require('js-yaml').load(untrusted_code) + ''

var yaml = require('js-yaml')

const yaml2 = require('js-yaml')

// ruleid:yaml_deserialize
yaml.load(untrusted_code)
// ruleid:yaml_deserialize
yaml2.load(untrusted_code)
