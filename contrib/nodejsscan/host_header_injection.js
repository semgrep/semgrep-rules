// https://www.acunetix.com/blog/articles/automated-detection-of-host-header-attacks/
app.get('/', function (req, res) {

    //semgrep string lateral support is pending
    var foo = {
        text: `reset url: https://${req.host}/password_reset/${token}`
    };

    //do not match
    var x = 'https://' + foo
    // do not match
    var x = "https://" + req.foo + "/reset" + foo;
    // do not match
    var x = "https://" + z + "/reset";



    // ruleid:host_header_injection
    var url = 'http://' + req.host;
    // ruleid:host_header_injection
    var reset = 'https://' + req.host + '/password_reset';
    // ruleid:host_header_injection
    var pass = "https://" + req.host + "/reset";

    // ruleid:host_header_injection
    var z = req.host;
    var pass = "https://" + z + "/reset";

    // ruleid:host_header_injection
    var reset_url = "Reset password: <a href='http://" + req.host + "/reset_pass'>Reset</a>";
    // ruleid:host_header_injection
    var foo = {
        text: 'password: https://' + req.host + '/token/',
        token: 'f2131ASDSADASoo',
    };

    // ruleid:host_header_injection
    var foo = {
        text: 'reset password: https://' + req['host'] + '/token/',
        token: 'f2131ASDSADASoo',
    };

    // ruleid:host_header_injection
    let x = "https://" + req['host'] + "/reset" + foo;
    // ruleid:host_header_injection
    x = "https://" + req("host") + "/reset" + foo + 'barr' + foo2;

    // ruleid:host_header_injection
    var foo = {
        text: 'reset password: https://' + req.host + '/resettoken/' + foo,
        token: 'f2131ASDSADASoo',
    };

});
