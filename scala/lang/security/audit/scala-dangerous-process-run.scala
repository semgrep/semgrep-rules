import akka.actor.{Props, Actor}
import scala.concurrent.duration._
import akka.pattern.ask

class TestOsCommand {

  def executeCommand(value:String) = Action {
    import sys.process._

    // ruleid: scala-dangerous-process-run
    val result = value.!!
    Ok("Result:\n"+result)
  }

  def executeCommand2(value:String) = Action {
    import sys.process._

    // ruleid: scala-dangerous-process-run
    val result = value !
    Ok("Result:\n"+result)
  }

  def executeCommand3(value:String) = Action {
    import sys.process._

    // ruleid: scala-dangerous-process-run
    val result = value.lazyLines
    Ok("Result:\n"+result)
  }

  def executeCommand4(value:String) = Action {
    import sys.process._

    // ok: scala-dangerous-process-run
    val cmd = "ls -lah"
    val result = cmd.!
    Ok("Result:\n"+result)
  }

  def executeCommand5() = Action {
    import sys.process._

    // ok: scala-dangerous-process-run
    val cmd = Seq("ls", "-lah")
    val result = cmd.!
    Ok("Result:\n"+result)
  }

  def executeCommand6() = Action {
    import sys.process._

    // ok: scala-dangerous-process-run
    val result = Seq("ls", "-lah").!!
    Ok("Result:\n"+result)
  }

  def executeCommand7(sender: Actor) = {
    // ok: scala-dangerous-process-run
    sender ! "FooBar"
  }

}