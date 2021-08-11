var Client = require('ftp');
function bad_ftp1() {
    let c = new Client();
    // ruleid: ftp-request
    c.connect({
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: false
        });
}

var Client = require('ftp');
function bad_ftp2() {
    let c = new Client();
    // ruleid: ftp-request
    c.connect({
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: implicit
        });
}

var Client = require('ftp');
function ok_ftp1() {
    let c = new Client();
    //ok: ftp-request
    var options = {
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: true
    }

    c.connect(options);
}

var Client = require('ftp');
function ok_ftp2() {
    let c = new Client();
    //ok: ftp-request
    var options = {
        host: ftpInfo.host,
        port: ftpInfo.port,
        user: ftpInfo.user,
        password: ftpInfo.password,
        secure: true
    }

    c.connect(options);
}
