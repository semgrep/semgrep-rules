//ruleid: telnet-request
const telnet = require('telnet-client');
function bad_telnet1() {
    const server = new telnet();

    // display server response
    server.on("data", function(data){
        console.log(''+data);
    });

    // login when connected
    server.on("connect", function(){
        server.write("login <user> <pass>");
    });

    // connect to server
    server.connect({
        host: "172.16.0.1",
        port: 9600
    });
}

//ruleid: telnet-request
const Telnet = require('telnet-client');
function bad_telnet2() {
    var connection = new Telnet()

    // these parameters are just examples and most probably won't work for your use-case.
    var params = {
    host: '127.0.0.1',
    port: 23,
    shellPrompt: '/ # ', // or negotiationMandatory: false
    timeout: 1500,
    // removeEcho: 4
    }

    connection.on('ready', function(prompt) {
    connection.exec(cmd, function(err, response) {
        console.log(response)
    })
    })

    connection.on('timeout', function() {
    console.log('socket timeout!')
    connection.end()
    })
}

// ruleid: telnet-request
var Telnet = require('telnet-client')
function bad_telnet3() {
    var connection = new Telnet()

    // these parameters are just examples and most probably won't work for your use-case.
    var params = {
    host: '127.0.0.1',
    port: 23,
    shellPrompt: '/ # ', // or negotiationMandatory: false
    timeout: 1500,
    // removeEcho: 4
    }

    connection.connect(params)
    .then(function(prompt) {
    connection.exec(cmd)
    .then(function(res) {
        console.log('promises result:', res)
    })
    }, function(error) {
    console.log('promises reject:', error)
    })
    .catch(function(error) {
    // handle the throw (timeout)
    })
}

//ruleid: telnet-request
var telnet = require('telnet')

function bad_telnet4() {
    telnet.createServer(function (client) {

    // make unicode characters work properly
    client.do.transmit_binary()

    // make the client emit 'window size' events
    client.do.window_size()

    // listen for the window size events from the client
    client.on('window size', function (e) {
        if (e.command === 'sb') {
        console.log('telnet window resized to %d x %d', e.width, e.height)
        }
    })

    // listen for the actual data from the client
    client.on('data', function (b) {
        client.write(b)
    })

    client.write('connected to Telnet server!')

    }).listen(23)
}
