const {exec, spawnSync} = require('child_process');

// ruleid: spawn-shell-true
const ls = spawn('ls', ['-lh', '/usr'], {shell:true});

// ruleid: spawn-shell-true
const pid = spawnSync('ls', ['-lh', '/usr'], {shell: '/bin/sh'});

// ok: spawn-shell-true
spawn('ls', ['-lh', '/usr'], {shell:false});

// ok: spawn-shell-true
spawn('ls', ['-lh', '/usr'], {});
