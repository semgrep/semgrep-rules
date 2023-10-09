(ns vulnerable-1
  (:require [clojure.xml :as xml]))

(defn vulnerable [x]
  // ruleid: documentbuilderfactory-xxe
  (clojure.xml/parse x))

(defn startparse-sax-doctype [s ch]
  (..
    (doto (javax.xml.parsers.SAXParserFactory/newInstance)
      // ruleid: documentbuilderfactory-xxe
      (.setFeature "http://apache.org/xml/features/disallow-doctype-decl" false)
      (.setFeature "http://xml.org/sax/features/external-general-entities" true)
      (.setFeature "http://xml.org/sax/features/external-parameter-entities" true))
    (newSAXParser)
    (parse s ch)))

(def vulnerable [input]
  (clojure.xml/parse input startparse-sax-doctype))

(defn startparse-sax-no-doctype [s ch]
  (..
    (doto (javax.xml.parsers.SAXParserFactory/newInstance)
      // ok: documentbuilderfactory-xxe
      (.setFeature "http://apache.org/xml/features/disallow-doctype-decl" true)
      (.setFeature "http://xml.org/sax/features/external-general-entities" true)
      (.setFeature "http://xml.org/sax/features/external-parameter-entities" true))
    (newSAXParser)
    (parse s ch)))

(defn startparse-sax-doctype-no-entities [s ch]
  (..
    (doto (javax.xml.parsers.SAXParserFactory/newInstance)
      // ok: documentbuilderfactory-xxe
      (.setFeature "http://apache.org/xml/features/disallow-doctype-decl" false)
      (.setFeature "http://xml.org/sax/features/external-general-entities" false)
      (.setFeature "http://xml.org/sax/features/external-parameter-entities" false))
    (newSAXParser)
    (parse s ch)))


