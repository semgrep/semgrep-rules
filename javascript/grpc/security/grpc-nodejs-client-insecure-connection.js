function test1() {
    // ruleid: grpc-nodejs-client-insecure-connection
    var grpc = require('grpc');

    var booksProto = grpc.load('books.proto');

    var client = new booksProto.books.BookService('127.0.0.1:50051', grpc.credentials.createInsecure());

    client.list({}, function(error, books) {
        if (error)
            console.log('Error: ', error);
        else
            console.log(books);
    });
}

function test2() {
    // ruleid: grpc-nodejs-client-insecure-connection
    var {credentials, load, Client} = require('grpc');

    var creds = someFunc() || credentials.createInsecure();

    var client = new Client('127.0.0.1:50051', creds);

    client.list({}, function(error, books) {
        if (error)
            console.log('Error: ', error);
        else
            console.log(books);
    });
}

function testOk() {
    // ok
    var {credentials, Client} = require('grpc');
    var channel_creds = credentials.createSsl(root_certs);
    var client = new Client(address, channel_creds);

    client.list({}, function(error, books) {
        if (error)
            console.log('Error: ', error);
        else
            console.log(books);
    });
}