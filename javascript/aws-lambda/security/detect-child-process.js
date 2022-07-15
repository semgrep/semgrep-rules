const cp = require('child_process');

exports.handler = async (event) => {
    // ruleid:detect-child-process
    cp.exec(`cat *.js ${event['file']}| wc -l`, (error, stdout, stderr) => {
        console.log(stdout)
    });

    // ruleid:detect-child-process
    cp.spawnSync(event['cmd']);

    // ok:detect-child-process
    cp.exec('ls')
};