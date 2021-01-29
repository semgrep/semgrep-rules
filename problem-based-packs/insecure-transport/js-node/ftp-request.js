// ruleid: ftp-request
var Client = require('ftp');
function bad_ftp1() {
    let c = new Client();
    c.connect({
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: false
        });
}

// ruleid: ftp-request
var Client = require('ftp');
function bad_ftp2() {
    let c = new Client();
    c.connect({
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: implicit
        });
}

//ok: ftp-request
var Client = require('ftp');
function ok_ftp1() {
    let c = new Client();
    var options = {
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: true
    }

    c.connect(options);
}

//ok: ftp-request
var Client = require('ftp');
function ok_ftp2() {
    let c = new Client();
    var options = {
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: true
    }

    c.connect(options);
}
