import * as Promise from "bluebird";

function bad1(input) {
// ruleid: tofastproperties-code-execution
  util.toFastProperties(input);
}

function ok1() {
// ok: tofastproperties-code-execution
  util.toFastProperties("smth hardcoded");
}
