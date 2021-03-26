const {exec, spawnSync} = require('child_process');

// ruleid:detect-child-process
exec(`cat *.js ${userInput}| wc -l`, (error, stdout, stderr) => {
  console.log(stdout)
});

// ruleid:detect-child-process
spawnSync(userInput);

// ok:detect-child-process
exec('ls')
