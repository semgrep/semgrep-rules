class Foo {
  def run1(message: String) = {
    import sys.process._
    // ruleid: dangerous-shell-run
    Seq("sh", "-c", message).!
  }

  def run2(message: String) = {
    import sys.process._
    // ruleid: dangerous-shell-run
    val result = Seq("bash", "-c", message).!!
    return result
  }

  def run3(message: String) = {
    import sys.process._
    // ok: dangerous-shell-run
    Seq("ls", "-la").!!
  }

  def run4(message: String) = {
    import sys.process._
    // ok: dangerous-shell-run
    Seq("sh", "-c", "ls").!!
  }

  def run5(message: String) = {
    import sys.process._
    // ok: dangerous-shell-run
    Seq("sh", "-c", message)
  }

  def run6(message: String) = {
    // ok: dangerous-shell-run
    val result = Seq("bash", "-c", message).!!
    return result
  }
}