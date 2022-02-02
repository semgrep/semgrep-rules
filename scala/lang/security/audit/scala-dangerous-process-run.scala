import sys.process._

class TestOsCommand {
  def executeCommand(value:String) = Action {
    // ruleid: scala-dangerous-process-run
    val result = value.!!
    Ok("Result:\n"+result)
  }

  def executeCommand2(value:String) = Action {
    // ruleid: scala-dangerous-process-run
    val result = value !
    Ok("Result:\n"+result)
  }

  def executeCommand3(value:String) = Action {
    // ruleid: scala-dangerous-process-run
    val result = value.lazyLines
    Ok("Result:\n"+result)
  }

  def executeCommand4(value:String) = Action {
    // ok: scala-dangerous-process-run
    val cmd = "ls -lah"
    val result = cmd.!
    Ok("Result:\n"+result)
  }

  def executeCommand5() = Action {
    // ok: scala-dangerous-process-run
    val cmd = Seq("ls", "-lah")
    val result = cmd.!
    Ok("Result:\n"+result)
  }

  def executeCommand6() = Action {
    // ok: scala-dangerous-process-run
    val result = Seq("ls", "-lah").!!
    Ok("Result:\n"+result)
  }

  def executeCommand6() = Action {
    // ok: scala-dangerous-process-run
    val result = "ls -lah".lazyLines
    Ok("Result:\n"+result)
  }
}
