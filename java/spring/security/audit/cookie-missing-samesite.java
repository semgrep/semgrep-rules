@Controller
public class CookieController {

    @RequestMapping(value = "/cookie", method = "GET")
    public void setCookie(@RequestParam String value, HttpServletResponse response) {
        // ok
        response.setHeader("Set-Cookie", "key=value; HttpOnly; SameSite=strict");
    }

    @RequestMapping(value = "/cookie", method = "GET")
    public void setSecureCookie(@RequestParam String value, HttpServletResponse response) {
        // ruleid:cookie-missing-samesite
        response.setHeader("Set-Cookie", "key=value; HttpOnly;");
    }
    
    @RequestMapping(value = "/cookie", method = "GET")
    public void setSecureHttponlyCookie(@RequestParam String value, HttpServletResponse response) {
        // ruleid:cookie-missing-samesite
        Cookie cookie = new Cookie("cookie", value);
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }
}
