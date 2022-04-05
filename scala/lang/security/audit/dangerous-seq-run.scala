class Foo {
  def run1(command: String, arg1: String) = {
    import sys.process._
    // ruleid: dangerous-seq-run
    Seq(command, arg1).!
  }

  def run2(command: String) = {
    import sys.process._
    // ruleid: dangerous-seq-run
    val result = Seq(command, "--some-arg").!!
    return result
  }

  def run3(message: String) = {
    import sys.process._
    // ok: dangerous-seq-run
    Seq("ls", "-la").!!
  }

  def run4(message: String) = {
    import sys.process._
    // ok: dangerous-seq-run
    Seq("sh", "-c", "ls").!!
  }

  def run5(message: String) = {
    import sys.process._
    // ok: dangerous-seq-run
    Seq(message, "123")
  }

  def run6(command: String) = {
    // ok: dangerous-seq-run
    val result = Seq(command, "--some-arg").!!
    return result
  }
}