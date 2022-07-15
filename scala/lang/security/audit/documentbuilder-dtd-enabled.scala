package org.test.test

import java.io.File
import javax.xml.parsers.DocumentBuilder
import javax.xml.parsers.DocumentBuilderFactory

class Foo {

  def run1(file: File) = {
    // ruleid: documentbuilder-dtd-enabled
    val docBuilderFactory = DocumentBuilderFactory.newInstance()
    val docBuilder = docBuilderFactory.newDocumentBuilder()
    val doc = docBuilder.parse(file)
    doc.getDocumentElement().normalize()
    val foobarList = doc.getElementsByTagName("Foobar")
    foobarList
  }

  def run2(file: File) = {
    // ruleid: documentbuilder-dtd-enabled
    val docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder()
    val doc = docBuilder.parse(file)
    doc.getDocumentElement().normalize()
    val foobarList = doc.getElementsByTagName("Foobar")
    foobarList
  }

  def okRun1(file: File) = {
    // ok: documentbuilder-dtd-enabled
    val docBuilderFactory = DocumentBuilderFactory.newInstance()
    val docBuilder = docBuilderFactory.newDocumentBuilder()

    docBuilder.setXIncludeAware(true)
    docBuilder.setNamespaceAware(true)

    docBuilder.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
    docBuilder.setFeature("http://xml.org/sax/features/external-general-entities", false)
    docBuilder.setFeature("http://xml.org/sax/features/external-parameter-entities", false)

    val doc = docBuilder.parse(file)
    doc.getDocumentElement().normalize()
    val foobarList = doc.getElementsByTagName("Foobar")
    foobarList
  }

  def okRun2(file: File) = {
    // ok: documentbuilder-dtd-enabled
    val docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder()

    docBuilder.setXIncludeAware(true)
    docBuilder.setNamespaceAware(true)

    docBuilder.setFeature("http://xml.org/sax/features/external-general-entities", false)
    docBuilder.setFeature("http://xml.org/sax/features/external-parameter-entities", false)
    docBuilder.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)

    val doc = docBuilder.parse(file)
    doc.getDocumentElement().normalize()
    val foobarList = doc.getElementsByTagName("Foobar")
    foobarList
  }

}