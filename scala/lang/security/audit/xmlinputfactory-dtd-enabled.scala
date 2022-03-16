package org.test.test

import java.io.{File, FileReader}
import javax.xml.stream.XMLInputFactory

class Foo {

  def run1(file: String) = {
    // ruleid: xmlinputfactory-dtd-enabled
    val factory = XMLInputFactory.newInstance()
    val fileReader = new FileReader(file)
    val xmlReader = factory.createXMLStreamReader(fileReader)
    doSmth(xmlReader)
  }

  def run2(file: String) = {
    // ruleid: xmlinputfactory-dtd-enabled
    val factory = XMLInputFactory.newFactory()
    val fileReader = new FileReader(file)
    val xmlReader = factory.createXMLStreamReader(fileReader)
    doSmth(xmlReader)
  }

  def okRun1(file: String) = {
    // ok: xmlinputfactory-dtd-enabled
    val factory = XMLInputFactory.newInstance
    factory.setProperty("javax.xml.stream.isSupportingExternalEntities", false)
    val fileReader = new FileReader(file)
    val xmlReader = factory.createXMLStreamReader(fileReader)
    doSmth(xmlReader)
  }

  def okRun2(file: String) = {
    // ok: xmlinputfactory-dtd-enabled
    val factory = XMLInputFactory.newFactory()
    factory.setProperty("javax.xml.stream.isSupportingExternalEntities", false)
    val fileReader = new FileReader(file)
    val xmlReader = factory.createXMLStreamReader(fileReader)
    doSmth(xmlReader)
  }

}