// ok:detect-eval-with-expression
eval('alert')

// ok:detect-eval-with-expression
window.eval('alert')


// ruleid:detect-eval-with-expression
window.eval(`alert('${location.href}')`)

let funcName = new URLSearchParams(window.location.search).get('a')
// ruleid:detect-eval-with-expression
var x = new Function(`return ${funcName}(a,b)`)
