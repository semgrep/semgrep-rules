async function okTest() {
  const p = Deno.run({
    cmd: ["echo", "hello"],
  });

  await p.status();
}

async function test1(userInput) {
  const p = Deno.run({
    // ruleid: deno-dangerous-run
    cmd: [userInput, "hello"],
    stdout: "piped",
    stderr: "piped",
  });

  await p.status();
}

async function test1(userInput) {
  const p = Deno.run({
    // ruleid: deno-dangerous-run
    cmd: ["bash", "-c", userInput],
    stdout: "piped",
    stderr: "piped",
  });

  await p.status();
}
