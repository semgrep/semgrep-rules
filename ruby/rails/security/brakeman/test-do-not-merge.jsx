// ruleid:unsafe-exec
exec("ls");

// ruleid:unsafe-exec
exec(some_var);

// ruleid:unsafe-exec
exec (foo);

// ruleid:unsafe-exec
exec (
  bar
);

// exec(foo)

console.log("exec(bar)")