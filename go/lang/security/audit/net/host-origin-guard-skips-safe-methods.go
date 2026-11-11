package api

import (
	"net/http"
	"strings"
)

type Server struct{ UIOrigin string }

func isMutating(m string) bool {
	return m != http.MethodGet && m != http.MethodHead && m != http.MethodOptions
}

// The shape fixed in KSail 7.203.23: reads skipped the guard.
func (s *Server) originGuardBad(next http.Handler) http.Handler {
	return http.HandlerFunc(func(writer http.ResponseWriter, request *http.Request) {
		// ruleid: host-origin-guard-skips-safe-methods
		if !isMutating(request.Method) || s.UIOrigin == "" {
			next.ServeHTTP(writer, request)
			return
		}
		if !strings.EqualFold("http://"+request.Host, s.UIOrigin) {
			http.Error(writer, "forbidden", http.StatusForbidden)
			return
		}
		if o := request.Header.Get("Origin"); o != "" && o != s.UIOrigin {
			http.Error(writer, "forbidden", http.StatusForbidden)
			return
		}
		next.ServeHTTP(writer, request)
	})
}

func originGuardBad2(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// ruleid: host-origin-guard-skips-safe-methods
		if r.Method == http.MethodGet {
			next.ServeHTTP(w, r)
			return
		}
		origin := r.Header.Get("Origin")
		if origin != "http://127.0.0.1:8080" {
			w.WriteHeader(http.StatusForbidden)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// The fixed shape: Host on every request, Origin when present.
func (s *Server) originGuardGood(next http.Handler) http.Handler {
	return http.HandlerFunc(func(writer http.ResponseWriter, request *http.Request) {
		// ok: host-origin-guard-skips-safe-methods
		if s.UIOrigin == "" {
			next.ServeHTTP(writer, request)
			return
		}
		if !strings.EqualFold("http://"+request.Host, s.UIOrigin) {
			http.Error(writer, "forbidden", http.StatusForbidden)
			return
		}
		if o := request.Header.Get("Origin"); o != "" && o != s.UIOrigin {
			http.Error(writer, "forbidden", http.StatusForbidden)
			return
		}
		next.ServeHTTP(writer, request)
	})
}

// A method switch with no Host or Origin check is a different concern.
func preflight(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// ok: host-origin-guard-skips-safe-methods
		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusNoContent)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// CSRF-style guard: still flagged, because a GET from a rebinding page passes
// unless Host is validated elsewhere.
func csrfProtect(h http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// ruleid: host-origin-guard-skips-safe-methods
		if r.Method == "GET" || r.Method == "HEAD" || r.Method == "OPTIONS" {
			h.ServeHTTP(w, r)
			return
		}
		host := r.Host
		if host == "" {
			http.Error(w, "no host", http.StatusForbidden)
			return
		}
		h.ServeHTTP(w, r)
	})
}
