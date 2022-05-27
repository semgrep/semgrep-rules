package com.test.test

import java.sql.{Connection, ResultSet, DriverManager}
import org.slf4j.LoggerFactory

object Smth {

  def call1(name: String) = {
    // ruleid: tainted-sql-string
    val sql = "SELECT * FROM table WHERE name = " + name + ";"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    val rs = stmt.execute(sql)
    rs
  }

  def call2(name: String) = {
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    // ruleid: tainted-sql-string
    val rs = stmt.execute(s"SELECT * FROM table WHERE name = $name;")
    rs
  }

  def call3(name: String) = {
    // ruleid: tainted-sql-string
    val sql = f"SELECT * FROM table WHERE name = $name%s;"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    val rs = stmt.execute(sql)
    rs
  }

  def call4(name: String) = {
    // ruleid: tainted-sql-string
    val sql = s"SELECT * FROM table WHERE name = ${name};"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    val rs = stmt.execute(sql)
    rs
  }

  def call5(name: String) = {
    // ruleid: tainted-sql-string
    val sql = s"SELECT * FROM table WHERE name = ${name + "smth"};"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    val rs = stmt.execute(sql)
    rs
  }

  def okCall1(name: String) = {
    val foobar = getFoobarFromEnv()
    // ok: tainted-sql-string
    val sql = "SELECT * FROM table WHERE name = " + foobar + ";"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    val rs = stmt.execute(sql)
    rs
  }

  def okCall2(name: String) = {
    val foobar = "Foobar"
    val conn = DriverManager.getConnection("jdbc:mysql://localhost:8080", "guest", "password")
    val stmt = conn.createStatement()
    // ok: tainted-sql-string
    val rs = stmt.execute(s"SELECT * FROM table WHERE name = $foobar;")
    rs
  }

  def okCall3(name: String) = {
    // ok: tainted-sql-string
    println("SELECT * FROM table WHERE name = " + name + ";")
    doSmth(name)
  }

  def loggingCall1(name: String) = {
    val log = LoggerFactory.getLogger(getClass.getSimpleName)
    // ok: tainted-sql-string
    log.trace("Create user" + name)
  }

  def loggingCall2(name: String) = {
    val scribe = LoggerFactory.getLogger(getClass.getSimpleName)
    // ok: tainted-sql-string
    scribe.warnToError("Create user" + name)
  }
}
