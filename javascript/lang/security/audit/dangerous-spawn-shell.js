const {spawn, spawnSync} = require('child_process');

let name = "bash"
// ruleid: dangerous-spawn-shell
spawnSync(name, ["-c", userInput]);

// ruleid: dangerous-spawn-shell
spawn('sh', [userInput]);

// ok: dangerous-spawn-shell
spawn('ls', ['-la', '/tmp']);
