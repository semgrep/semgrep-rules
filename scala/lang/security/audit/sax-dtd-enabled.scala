package org.test.test

import java.io.File
import org.dom4j.io.SAXReader
import org.dom4j.{Document}
import javax.xml.parsers.SAXParserFactory

class Foo {

  def run1(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ruleid: sax-dtd-enabled
    val saxReader = new SAXReader()

    val doc = Try(saxReader.read(file))

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

  def run2(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ruleid: sax-dtd-enabled
    val factory = SAXParserFactory.newInstance()
    val saxReader = factory.newSAXParser()

    val doc = Try(saxReader.read(file))

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

  def run3(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ruleid: sax-dtd-enabled
    val factory = SAXParserFactory.newInstance()

    val doc = doSomethingWithFactory(factory)

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

  def run4(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ruleid: sax-dtd-enabled
    val saxReader = SAXParserFactory.newInstance().newSAXParser()

    val doc = Try(saxReader.read(file))

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

  def okRun1(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ok: sax-dtd-enabled
    val saxReader = new SAXReader()

    saxReader.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
    saxReader.setFeature("http://xml.org/sax/features/external-general-entities", false)
    saxReader.setFeature("http://xml.org/sax/features/external-parameter-entities", false)

    val doc = Try(saxReader.read(file))

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

  def okRun2(xmlFilePath:String) = {

    val file = new File(xmlFilePath)
    // ok: sax-dtd-enabled
    val factory = SAXParserFactory.newInstance()
    val saxReader = factory.newSAXParser()

    saxReader.setFeature("http://xml.org/sax/features/external-general-entities", false)
    saxReader.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
    saxReader.setFeature("http://xml.org/sax/features/external-parameter-entities", false)

    val doc = Try(saxReader.read(file))

    val result = doc match  {
      case Success(r) => r
      case Failure(exception) => println("getDocumentExcetion:" + exception.getMessage)
    }

    result.asInstanceOf[Document]
  }

}