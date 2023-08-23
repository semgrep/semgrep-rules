// ruleid: detect-redos
const re = new RegExp("([a-z]+)+$", "i"); 
// ruleid: detect-redos
const re = new RegExp(/([a-z]+)+$/, "i"); 

var r = /^\\w+([-_+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$/
// ruleid: detect-redos
new RegExp(r, "i");
// ruleid: detect-redos
r.test(a)
// ruleid: detect-redos
"a".match(r)
// ok: detect-redos
"a".match(b)
// ok: detect-redos
"a".match("([a-z])")
var c = /([a-z])/
// ok: detect-redos
c.test(a)