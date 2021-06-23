// ok:detect-eval-with-expression
eval('alert')

// ok:detect-eval-with-expression
window.eval('alert')

// ruleid:detect-eval-with-expression
eval(b)

// ruleid:detect-eval-with-expression
window.eval('alert(' + c + ')')

// ruleid:detect-eval-with-expression
var x = new Function('a', 'b', `return ${funcName}(a,b)`)

// ruleid:detect-eval-with-expression
var y = Function('a', 'b', code)
