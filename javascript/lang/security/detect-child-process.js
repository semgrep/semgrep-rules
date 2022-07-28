const {exec, spawnSync} = require('child_process');

// ruleid:detect-child-process
exec(`cat *.js ${userInput}| wc -l`, (error, stdout, stderr) => {
  console.log(stdout)
});

// ruleid:detect-child-process
spawnSync(userInput);

// ok:detect-child-process
exec('ls')

const parentMachine = createMachine({
  id: 'parent',
  initial: 'waiting',
  context: {
    localOne: null
  },
  states: {
    waiting: {
      entry: assign({
        // ok:detect-child-process
        localOne: () => spawn(remoteMachine)  // <--
      }),
      on: {
        'LOCAL.WAKE': {
          actions: send({ type: 'WAKE' }, { to: (context) => context.localOne })
        },
        'REMOTE.ONLINE': { target: 'connected' }
      }
    },
    connected: {}
  }
});
