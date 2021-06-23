/**
 * Only report `eval` when we provide it with non-constant parameters.
 */

/**
 * Negative matches
 */

// ok
let func = new Function('var x = "static strings are okay";');
func();

// ok
const constVar = "function staticStrings() { return 'static strings are okay';}";
let constVarFunc = new Function(constVar);
constVarFunc();

// ok - const within another const
let func2 = new Function(`${constVar}`);
func2();

// ok - concatenating with another const okay
const secondConstVar = 'this is a const variable';
let func3 = new Function(constVar + secondConstVar);

// ok - not evaluated
let notEvaluatedFunc = new Function(document.getElementById('userInput'));

/**
 * Positive Matches
 */

let dynamic = window.prompt() // arbitrary user input

// ruleid:new-function-detected
func = new Function(dynamic + 'possibly malicious code');
func();

// ruleid:new-function-detected
func2 = new Function(`${dynamic} possibly malicious code`);
func2();

// ruleid:new-function-detected
func3 = new Function(dynamic.concat(''));
func3();

function evalSomething(something) {
    // ruleid:new-function-detected
    let func = new Function(something);
    func();
}
