function dynamicRequire1(packageName) {
    // ruleid: detect-non-literal-require
    var a = require(packageName)
    return a;
}

function dynamicRequire2(source, file) {
    // ruleid: detect-non-literal-require
    require(path.resolve(process.cwd(), file, source));
}

function okDynamicRequire1() {
    var lib = path.join(path.dirname(fs.realpathSync(__filename)), "index.js");
    // ok: detect-non-literal-require
    require(lib).run(process.argv.slice(2)); 
}

function okDynamicRequire2(userInput) {
    var name = process.env.NAME
    var path = name + '/smth/path';
    var mod = path + '/module.js';
    // ok: detect-non-literal-require
    require(mk).main(top, userInput);
}

function okDynamicRequire3(userInput) {
    var lib  = path.join(path.dirname(fs.realpathSync(__filename)), 'lib');
    // ok: detect-non-literal-require
    require(lib + '/foobar').run(userInput);
}

function okDynamicRequire4(userInput) {
    // ok:detect-non-literal-require
    var a = require('b')
}
function okDynamicRequire5(userInput) {
    // ok:detect-non-literal-require
    var a = require(process.env.VAR)
}