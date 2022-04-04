import sys.process._

class Foo {
  def run1(command: String, arg1: String) = {
    // ruleid: dangerous-seq-run
    Seq(command, arg1).!
  }

  def run2(command: String) = {
    // ruleid: dangerous-seq-run
    val result = Seq(command, "--some-arg").!!
    return result
  }

  def run3(message: String) = {
    // ok: dangerous-seq-run
    Seq("ls", "-la").!!
  }

  def run4(message: String) = {
    // ok: dangerous-seq-run
    Seq("sh", "-c", "ls").!!
  }

  def run5(message: String) = {
    // ok: dangerous-seq-run
    Seq(message, "123")
  }
}