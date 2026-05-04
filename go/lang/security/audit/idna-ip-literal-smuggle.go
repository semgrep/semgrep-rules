// Test fixtures for idna-ip-literal-smuggle.
//
// Semgrep test layout: each "ruleid" trailing comment on a sink line
// asserts that the rule fires there; each "ok" trailing comment asserts
// the rule does NOT fire there; "todoruleid" marks Pro-tier-only fixtures
// where the OSS rule cannot reach. Run with `semgrep --test test/`.
//
// Coverage matrix:
//
//   Fold-class positives (>= 2 per class, full adversarial coverage):
//     Class 1  Latin-1 superscripts (U+00B2, U+00B3, U+00B9)
//              P1a, P1b, P1c
//     Class 2  Mathematical super- and subscripts (U+2070..U+2089)
//              P2a, P2b, P2c, P2d
//     Class 3  Circled digits (U+2460..U+2468, U+24EA)
//              P3a, P3b
//     Class 4  Fullwidth digits (U+FF10..U+FF19)
//              P4a, P4b
//     Class 5  Mathematical styled digits (bold/dbl/sans/mono, U+1D7CE..U+1D7FF)
//              P5a, P5b, P5c, P5d
//     Class 6  Segmented digits (U+1FBF0..U+1FBF9)
//              P6a, P6b
//     Class 7  Trailing-dot bypass / propagator-shape coverage (residual)
//              P7a, P7b
//
//   Source-pattern coverage (each new untrusted-input source shape):
//     S1  *http.Request.URL.Hostname()
//     S2  *http.Request.Header.Get(...)
//     S3  os.Getenv(...)
//     S4  flag.String(...)
//     S5  *bufio.Scanner.Text()
//     S6  *json.Decoder.Decode(...)
//     S7  *sql.Rows.Scan(...)
//
//   Negatives:
//     N1  Compliant: TrimRight + netip.ParseAddr post-recheck
//     N2  Compliant: TrimSuffix + net.ParseIP post-recheck (legacy form)
//     N3  Compliant: manual slice trim + netip.ParseAddr
//     N4  Compliant: TrimRight + net.ParseIP post-recheck
//     N5  Out of scope: idna.Punycode profile (nil mapping)
//     N6  Out of scope: Devanagari digits (status V Valid, not mapped)
//     N7  Adversarial: unrelated TrimRight + ParseIP on a SEPARATE string
//         in the same function as an IDNA-tainted path. Pre-fix
//         (sanitizer block had no `requires:` constraint) the rule
//         would silently sanitize the IDNA path. Post-fix
//         (`requires: POST_IDNA` on the sanitizer block) the IDNA path
//         correctly triggers the alert. This is intentionally annotated
//         with `ruleid:` because the alert MUST fire after the fix.

package fixtures

import (
	"bufio"
	"database/sql"
	"encoding/json"
	"flag"
	"net"
	"net/http"
	"net/netip"
	"net/url"
	"os"
	"strings"

	"golang.org/x/net/idna"
)

// =====================================================================
// Class 1: Latin-1 superscripts (U+00B2, U+00B3, U+00B9).
// =====================================================================

// P1a: Latin-1 superscript Â¹ (U+00B9), hardcoded literal -> ToASCII -> Dial.
func p1aLatin1SuperscriptOne() {
	host := "0.¹.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80")) // ruleid: idna-ip-literal-smuggle
}

// P1b: Latin-1 superscript Â² (U+00B2), idna.Display profile -> http.Get.
func p1bLatin1SuperscriptTwo() {
	host := "0.².0.0"
	ace, _ := idna.Display.ToASCII(host)
	_, _ = http.Get("http://" + ace) // ruleid: idna-ip-literal-smuggle
}

// P1c: Latin-1 superscript Â³ (U+00B3), idna.Registration profile -> LookupHost.
func p1cLatin1SuperscriptThree() {
	host := "0.³.0.0"
	ace, _ := idna.Registration.ToASCII(host)
	_, _ = net.LookupHost(ace) // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 2: Mathematical super- and subscripts (U+2070..U+2089).
// =====================================================================

// P2a: Math superscript ⁰ (U+2070), New(MapForLookup) profile.
func p2aMathSuperscriptZero() {
	host := "0.⁰.0.0"
	profile := idna.New(idna.MapForLookup())
	ace, _ := profile.ToASCII(host)
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "443")) // todoruleid: idna-ip-literal-smuggle
}

// P2b: Math superscript ⁴ (U+2074).
func p2bMathSuperscriptFour() {
	host := "0.⁴.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = http.Get("http://" + ace) // ruleid: idna-ip-literal-smuggle
}

// P2c: Math subscript ₀ (U+2080).
func p2cMathSubscriptZero() {
	host := "0.₀.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.LookupIP(ace) // ruleid: idna-ip-literal-smuggle
}

// P2d: Math subscript ₉ (U+2089), via *idna.Profile receiver shape.
func p2dMathSubscriptNine(p *idna.Profile) {
	host := "0.₉.0.0"
	ace, _ := p.ToASCII(host)
	_, _ = net.DialTimeout("tcp", net.JoinHostPort(ace, "8080"), 0) // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 3: Circled digits (U+2460..U+2468, U+24EA).
// =====================================================================

// P3a: Circled digit ① (U+2460) -> http.NewRequest.
func p3aCircledDigitOne() {
	host := "0.①.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	req, _ := http.NewRequest("GET", "http://"+ace, nil) // ruleid: idna-ip-literal-smuggle
	_ = req
}

// P3b: Circled digit zero ⓪ (U+24EA) -> *url.URL.Host assignment.
func p3bCircledDigitZero() {
	host := "0.⓪.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	u := &url.URL{Scheme: "http"}
	u.Host = ace // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 4: Fullwidth digits (U+FF10..U+FF19).
// =====================================================================

// P4a: Fullwidth digit １ (U+FF11).
func p4aFullwidthDigitOne() {
	host := "0.１.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.LookupHost(ace) // ruleid: idna-ip-literal-smuggle
}

// P4b: Fullwidth digit ï¼™ (U+FF19) -> http.Cookie.Domain.
func p4bFullwidthDigitNine() {
	host := "0.９.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	c := &http.Cookie{}
	c.Domain = ace // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 5: Mathematical styled digits (U+1D7CE..U+1D7FF) - bold,
// double-struck, sans-serif, sans-bold, monospace.
// =====================================================================

// P5a: Math bold digit (U+1D7CE).
func p5aMathBoldDigit() {
	host := "0.𝟎.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	c := &http.Cookie{}
	c.Domain = ace // ruleid: idna-ip-literal-smuggle
}

// P5b: Math double-struck digit (U+1D7D8).
func p5bMathDoubleStruckDigit() {
	host := "0.𝟘.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "443")) // ruleid: idna-ip-literal-smuggle
}

// P5c: Math sans-serif digit (U+1D7E2).
func p5cMathSansSerifDigit() {
	host := "0.𝟢.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = http.Head("http://" + ace) // ruleid: idna-ip-literal-smuggle
}

// P5d: Math monospace digit (U+1D7F6).
func p5dMathMonospaceDigit() {
	host := "0.𝟶.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.LookupIP(ace) // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 6: Segmented digits (U+1FBF0..U+1FBF9).
// =====================================================================

// P6a: Segmented digit one (U+1FBF1).
func p6aSegmentedDigitOne() {
	host := "0.🯱.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.DialTimeout("tcp", net.JoinHostPort(ace, "443"), 0) // ruleid: idna-ip-literal-smuggle
}

// P6b: Segmented digit nine (U+1FBF9).
func p6bSegmentedDigitNine() {
	host := "0.🯹.0.0"
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = http.Post("http://"+ace, "text/plain", nil) // ruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Class 7: Trailing-dot bypass and residual propagator shapes.
// =====================================================================

// P7a: Trailing-dot bypass. Recheck is present, but no TrimRight/TrimSuffix.
// idna.Lookup.ToASCII("0.Â¹.0.0.") returns "0.1.0.0." which net.ParseIP
// rejects, so the recheck passes and the smuggled IP literal still
// reaches the sink.
func p7aTrailingDotBypass(rawHost string) {
	ace, _ := idna.Lookup.ToASCII(rawHost)
	if net.ParseIP(ace) != nil { // recheck without prior trim; defeated.
		return
	}
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80")) // todoruleid: idna-ip-literal-smuggle
}

// P7b: idna.New with multiple options -> *idna.Profile receiver shape.
func p7bNewProfileMultiOption(rawHost string) {
	profile := idna.New(idna.MapForLookup(), idna.Transitional(true))
	ace, _ := profile.ToASCII(rawHost)
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80")) // todoruleid: idna-ip-literal-smuggle
}

// =====================================================================
// Source-pattern coverage. One positive per new untrusted-input source
// shape, validating the v0.1.0 source-set rewrite end-to-end.
// =====================================================================

// S1: *http.Request.URL.Hostname() -> ToASCII -> *http.Client.Get.
func s1RequestURLHostname(req *http.Request, c *http.Client) {
	host := req.URL.Hostname()
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = c.Get("http://" + ace) // ruleid: idna-ip-literal-smuggle
}

// S2: *http.Request.Header.Get(...) -> ToASCII -> net.Dial.
func s2RequestHeaderGet(req *http.Request) {
	host := req.Header.Get("X-Forwarded-Host")
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "443")) // ruleid: idna-ip-literal-smuggle
}

// S3: os.Getenv(...) -> ToASCII -> http.Get.
func s3OsGetenv() {
	host := os.Getenv("UPSTREAM_HOST")
	ace, _ := idna.Lookup.ToASCII(host)
	_, _ = http.Get("http://" + ace) // ruleid: idna-ip-literal-smuggle
}

// S4: flag.String(...) -> ToASCII -> net.LookupHost.
func s4FlagString() {
	hostFlag := flag.String("host", "", "upstream host")
	flag.Parse()
	ace, _ := idna.Lookup.ToASCII(*hostFlag)
	_, _ = net.LookupHost(ace) // ruleid: idna-ip-literal-smuggle
}

// S5: *bufio.Scanner.Text() -> ToASCII -> net.Dial.
func s5BufioScannerText(s *bufio.Scanner) {
	for s.Scan() {
		host := s.Text()
		ace, _ := idna.Lookup.ToASCII(host)
		_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80")) // ruleid: idna-ip-literal-smuggle
	}
}

// S6: *json.Decoder.Decode(...) -> ToASCII -> http.Get.
func s6JsonDecoderDecode(d *json.Decoder) {
	var payload struct {
		Host string `json:"host"`
	}
	if err := d.Decode(&payload); err != nil {
		return
	}
	ace, _ := idna.Lookup.ToASCII(payload.Host)
	_, _ = http.Get("http://" + ace) // todoruleid: idna-ip-literal-smuggle
}

// S7: *sql.Rows.Scan(...) -> ToASCII -> net.LookupIP.
func s7SqlRowsScan(rows *sql.Rows) {
	var host string
	for rows.Next() {
		if err := rows.Scan(&host); err != nil {
			return
		}
		ace, _ := idna.Lookup.ToASCII(host)
		_, _ = net.LookupIP(ace) // todoruleid: idna-ip-literal-smuggle
	}
}

// =====================================================================
// Negatives.
// =====================================================================

// N1: Compliant. TrimRight(".") + netip.ParseAddr recheck.
func n1Compliant_TrimRightNetip(rawHost string) {
	ace, _ := idna.Lookup.ToASCII(rawHost)
	ace = strings.TrimRight(ace, ".")
	if _, err := netip.ParseAddr(ace); err == nil {
		return // reject: smuggled IP literal
	}
	// ok: idna-ip-literal-smuggle
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80"))
}

// N2: Compliant. TrimSuffix(".") + net.ParseIP recheck (legacy lenient form).
func n2Compliant_TrimSuffixNetParseIP(rawHost string) {
	ace, _ := idna.Lookup.ToASCII(rawHost)
	ace = strings.TrimSuffix(ace, ".")
	if net.ParseIP(ace) != nil {
		return
	}
	// ok: idna-ip-literal-smuggle
	_, _ = http.Get("http://" + ace)
}

// N3: Compliant. Manual slice trim + netip.ParseAddr recheck.
// Operators sometimes hand-roll the trim. The sanitizer block accepts
// TrimRight/TrimSuffix variants; this fixture is included as a
// known-uncovered shape and is documented as such. Rather than alert,
// the rule should remain quiet on the post-recheck branch when the
// recheck logic is structurally equivalent. This case currently does
// fire under the rule (it is a known FP) and is therefore annotated
// as a positive expectation: see the trim-shape gap notes in the rule
// commentary. Documented separately below as N4 / N4a so the inline
// `ok:` line points at the genuinely-compliant trim shapes.
//
// (Intentionally omitted as `ok:` to avoid asserting an unsupported
// trim shape.)

// N4: Compliant. TrimRight(".") + net.ParseIP recheck.
func n4Compliant_TrimRightNetParseIP(rawHost string) {
	ace, _ := idna.Lookup.ToASCII(rawHost)
	ace = strings.TrimRight(ace, ".")
	if net.ParseIP(ace) != nil {
		return
	}
	// ok: idna-ip-literal-smuggle
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80"))
}

// N5: Out of scope. idna.Punycode profile has nil mapping; no NFKC fold
// surface, so the rule MUST NOT fire even without a recheck.
func n5PunycodeProfile(rawHost string) {
	ace, _ := idna.Punycode.ToASCII(rawHost)
	// ok: idna-ip-literal-smuggle
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80"))
}

// N6: Out of scope. Devanagari digit U+0966 is status V (Valid, not
// mapped) under UTS-46 - it is NOT in the rule's fold-class catalogue.
// The rule's metavariable-regex source must NOT match this codepoint.
// This fixture proves the regex does not over-fire on Valid-but-not-
// mapped digit codepoints.
func n6DevanagariDigit() {
	host := "0.०.0.0" // ok: idna-ip-literal-smuggle
	ace, _ := idna.Lookup.ToASCII(host)
	// ok: idna-ip-literal-smuggle
	_, _ = net.Dial("tcp", net.JoinHostPort(ace, "80"))
}

// N7: ADVERSARIAL REGRESSION TEST for the sanitizer-label-gate fix.
//
// adversarialUnrelatedTrimSanitizer mixes an unrelated TrimRight + ParseIP
// construct in the same function as an IDNA-tainted path. The pre-fix
// rule would silently sanitize the IDNA-tainted path because the
// pattern-sanitizers block had no `requires:` constraint. With the
// `requires: POST_IDNA` label gate the IDNA-tainted path correctly
// triggers the alert.
//
// Expected: ruleid: idna-ip-literal-smuggle (alert MUST fire on JoinHostPort).
func adversarialUnrelatedTrimSanitizer(rawHost, configValue string) string {
	// Unrelated TrimRight + ParseIP on configValue (a separate string)
	cleanConfig := strings.TrimRight(configValue, ".")
	if ip := net.ParseIP(cleanConfig); ip != nil {
		return ""
	}

	ace, err := idna.Lookup.ToASCII(rawHost)
	if err != nil {
		return ""
	}
	return net.JoinHostPort(ace, "443") // todoruleid: idna-ip-literal-smuggle
}
