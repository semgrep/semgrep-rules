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

(def command "bash")
// ruleid: command-injection-shell-call
(println (:out (sh command "-c" "rsa" "-b" arg "-P" "" "-C" "" "-f" filename)))

(defn greetings [msg]
// ruleid: command-injection-shell-call
(println (:out (sh "/bin/bash" "-c" msg ))))
// ruleid: command-injection-shell-call
(println (:out (sh "bash" "-c" msg )))
// ruleid: command-injection-shell-call
(println (:out (sh "sh" "-c" msg )))
// ok: command-injection-shell-call
(println (:out (sh "echo" "-c" msg )))

(greetings "whoami && pwd")