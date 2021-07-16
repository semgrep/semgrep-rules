// 'undefined' is "assignable" syntactically but it's read-only (since
// ECMAScript 5), so its value will remain 'undefined'.
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined

// ok:assigned-undefined
alert(undefined); //alerts "undefined"
// ruleid:assigned-undefined
var undefined = "new value";
alert(undefined) // alerts "new value"

// ruleid:assigned-undefined
undefined = "new value";
alert(undefined) // alerts "new value"
