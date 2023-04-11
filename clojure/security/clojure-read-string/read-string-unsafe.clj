(ns clojure-read-string-not-vulnerable
(:refer-clojure :exclude [read read-string]))

(defn read-string [^"[B" v]
  (String. v))

(defn not-vulnerable [x]
// ok: read-string-unsafe
  (read-string x))

(ns clojure-read-string
  (:require [clojure.edn :as edn]))

(defn vulnerable [x]
// ruleid: read-string-unsafe
  (read-string x))

(defn not-vulnerable [x]
  (edn/read-string x))