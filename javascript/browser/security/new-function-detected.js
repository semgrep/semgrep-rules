/**
 * Only report `eval` when we provide it with non-constant parameters.
 */

/**
 * Negative matches
 */

let func = new Function('var x = "static strings are okay";');
func();

const constVar = "function staticStrings() { return 'static strings are okay';}";
let constVarFunc = new Function(constVar);
constVarFunc();

let func2 = new Function(`${constVar}`);
func2();

const secondConstVar = 'this is a const variable';
let func3 = new Function(constVar + secondConstVar);

let notEvaluatedFunc = new Function(document.getElementById('userInput'));

/**
 * Positive Matches
 */

let dynamic = window.prompt() // arbitrary user input


func = new Function(dynamic + 'possibly malicious code');
func();

func2 = new Function(`${dynamic} possibly malicious code`);
func2();

func3 = new Function(dynamic.concat(''));
func3();

function evalSomething(something) {
    let func = new Function(something);
    func();
}
