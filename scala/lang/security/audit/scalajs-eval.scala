package controllers

import scala.scalajs.js

object Smth {
  def call1(code: String) = {
    // ruleid: scalajs-eval
    js.eval(s"console.log($code)")
    // ok: scalajs-eval
    js.eval("FooBar()")
    true
  }
}

object FooBar {
  def call2(code: String) = {
    // ruleid: scalajs-eval
    js.eval("console.log(" + code +")")
    // ok: scalajs-eval
    js.eval("FooBar()")
    true
  }
}
