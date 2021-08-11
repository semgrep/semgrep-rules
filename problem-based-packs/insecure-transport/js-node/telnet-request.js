const telnet = require('telnet-client');
function bad_telnet1() {
    const server = new telnet();

    // display server response
    // ruleid:telnet-request
    server.on("data", function(data){
        console.log(''+data);
    });

    // login when connected
    // ruleid:telnet-request
    server.on("connect", function(){
        server.write("login <user> <pass>");
    });

    // connect to server
    // ruleid:telnet-request
    server.connect({
        host: "172.16.0.1",
        port: 9600
    });
}

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

    // ruleid:telnet-request
    connection.on('ready', function(prompt) {
    connection.exec(cmd, function(err, response) {
        console.log(response)
    })
    })

    // ruleid:telnet-request
    connection.on('timeout', function() {
    console.log('socket timeout!')
    connection.end()
    })
}

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

    // ruleid:telnet-request
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

var telnet = require('telnet')

function bad_telnet4() {
    // ruleid:telnet-request
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
