var forge = require("node-forge");

// ruleid: node-forge-open-redirect
var url = forge.util.parseUrl("https:/\/\/\www.github.com/foo/bar");

console.log(url);

