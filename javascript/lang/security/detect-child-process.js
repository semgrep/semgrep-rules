const {exec, spawnSync} = require('child_process');
const cp = require('child_process'); 

function a(args) {
  // ruleid:detect-child-process
  exec(`cat *.js ${args[0]}| wc -l`, (error, stdout, stderr) => {
    console.log(stdout)
  });
}

function a(userInput) {
  // ruleid:detect-child-process
  cp.spawnSync(userInput);
}

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
