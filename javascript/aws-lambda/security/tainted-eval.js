exports.handler = async (event) => {
    // ok:tainted-eval
    eval('alert')

    // ruleid:tainted-eval
    eval(event['smth'])

    // ruleid:tainted-eval
    var x = new Function('a', 'b', `return ${event['func']}(a,b)`)

    // ruleid:tainted-eval
    var y = Function('a', 'b', event['code'])
}