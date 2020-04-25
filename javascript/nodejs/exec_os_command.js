var child_process = require('child_process');
var x = 1;
app.get('/', function (req, res) {
    // ruleid: generic_os_command_exec
    child_process.exec(
        req.query.file_path,
        function (err, data) {
            console.log('err: ', err)
            console.log('data: ', data);
        });


    //Do not detect this
    child_process.exec(
        foo + "asdD",
        function (err, data) {
            console.log('err: ', err)
            console.log('data: ', data);
        });
    // ruleid: generic_os_command_exec
    child_process.execSync(
        req.query.file_path + 'rsync -avAXz --info=progress2 "/src" "/dest"',
        { stdio: 'inherit' });

    res.send('Hello World!')
})

var foo = '1';
// ruleid: node_os_command_exec
require('child_process').exec(foo + 'info=progress2 "/src" "/dest"');