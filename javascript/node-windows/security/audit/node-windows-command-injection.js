var wincmd = require('node-windows');
var input = window.prompt('a');
var asdf = 'asdf';

// ruleid: node-windows-command-injection
wincmd.kill("12345; calc.exe", function(){
    console.log('Process Killed');
});

// ruleid: node-windows-command-injection
wincmd.kill(input, function(){
    console.log('Process Killed');
});

// ruleid: node-windows-command-injection
wincmd.kill(asdf, function(){
    console.log('Process Killed');
});

