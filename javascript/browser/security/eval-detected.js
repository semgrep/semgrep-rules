// ok
eval('var x = "static strings are okay";');

// ok
const blah = "function staticStrings() { return 'static strings are okay';}";
eval(blah);

let dynamic = "function dynamicStrings() { return 'dynamic strings are not'; }"

// ruleid:eval-detected
eval(dynamic + '');

// ruleid:eval-detected
eval(`${dynamic}`);

// ruleid:eval-detected
eval(dynamic.concat(''));

function evalSomething(something) {
    // ruleid:eval-detected
    eval(something);
}
