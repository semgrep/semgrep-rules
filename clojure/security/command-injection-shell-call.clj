(ns com.semgrep.test
  (:require [clojure.java.shell :refer [sh]]
            [clojure.tools.logging :as log]
            [clojure.string :refer [trim]]
            [clojure.java.io :as io]))
(use '[clojure.java.shell :only [sh]])

(require '[clojure.java.shell :refer [sh]])
  (:require [clojure.java.io :as io]
            [clojure.java.shell :as shell])
  (:use [clojure.string :only [replace-first split upper-case trim-newline join]]
        [clojure.java.shell :only [sh]]
        [clojure.tools.cli :only (cli)])


// ruleid: command-injection-shell-call
(println (:out (sh command "-t" "rsa" "-b" arg "-P" "" "-C" "" "-f" filename)))



// ok: command-injection-shell-call
(println (:out (sh "echo" "Printing a command-line output")))
