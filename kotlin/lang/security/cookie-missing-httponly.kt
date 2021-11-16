public class CookieController {
    public fun setCookie(value: String, response: HttpServletResponse) {
        val cookie: Cookie = Cookie("cookie", value)
        // ruleid: cookie-missing-httponly
        response.addCookie(cookie)
    }

    public fun setSecureCookie(value: String, response: HttpServletResponse) {
        val cookie: Cookie = Cookie("cookie", value)
        cookie.setSecure(true)
        // ruleid: cookie-missing-httponly
        response.addCookie(cookie)
    }

    public fun setSecureHttponlyCookie(value: String, response: HttpServletResponse ) {
        val cookie: Cookie = Cookie("cookie", value)
        cookie.setSecure(true)
        cookie.setHttpOnly(true)
        // ok: cookie-missing-httponly
        response.addCookie(cookie)
    }

    public fun explicitDisable(value: String, response: HttpServletResponse) {
        val cookie: Cookie = Cookie("cookie", value)
        cookie.setSecure(false)
        // ruleid:cookie-missing-httponly
        cookie.setHttpOnly(false)
        response.addCookie(cookie)
    }
}
