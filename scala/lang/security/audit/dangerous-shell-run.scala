import sys.process._

class Foo {
  def run1(message: String) = {
    // ruleid: dangerous-shell-run
    Seq("sh", "-c", message).!
  }

  def run2(message: String) = {
    // ruleid: dangerous-shell-run
    val result = Seq("bash", "-c", message).!!
    return result
  }

  def run3(message: String) = {
    // ok: dangerous-shell-run
    Seq("ls", "-la").!!
  }

  def run4(message: String) = {
    // ok: dangerous-shell-run
    Seq("sh", "-c", "ls").!!
  }

  def run5(message: String) = {
    // ok: dangerous-shell-run
    Seq("sh", "-c", message)
  }
}