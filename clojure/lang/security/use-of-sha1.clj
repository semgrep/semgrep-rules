(import 'java.security.MessageDigest
        'java.math.BigInteger)

(defn sha1 [s]
  // ruleid: use-of-sha1
  (let [algorithm (MessageDigest/getInstance "SHA-1")
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(defn sha1b [s]
  // ruleid: use-of-sha1
  (let [algorithm (MessageDigest/getInstance MessageDigestAlgorithms/SHA-1)
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(defn sha1c [s]
  // ruleid: use-of-sha1
  (let [algorithm (MessageDigest/getInstance org.apache.commons.codec.digest.MessageDigestAlgorithms/SHA-1)
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(defn sha256 [s]
  // ok: use-of-sha1
  (let [algorithm (MessageDigest/getInstance "SHA-256")
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(defn sha256b [s]
  // ok: use-of-sha1
  (let [algorithm (MessageDigest/getInstance MessageDigestAlgorithms/SHA-256)
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))

(defn sha256c [s]
  // ok: use-of-sha1
  (let [algorithm (MessageDigest/getInstance org.apache.commons.codec.digest.MessageDigestAlgorithms/SHA-256)
        size (* 2 (.getDigestLength algorithm))
        raw (.digest algorithm (.getBytes s))
        sig (.toString (BigInteger. 1 raw) 16)
        padding (apply str (repeat (- size (count sig)) "0"))]
    (str padding sig)))
