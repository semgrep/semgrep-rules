@Controller
public class CookieController {

    @RequestMapping(value = "/cookie", method = "GET")
    public void setCookie(@RequestParam String value, HttpServletResponse response) {
        Cookie cookie = new Cookie("cookie", value);
        // ruleid: spring-cookie-missing-secure-flag
        response.addCookie(cookie);
    }

    @RequestMapping(value = "/cookie", method = "GET")
    public void setSecureCookie(@RequestParam String value, HttpServletResponse response) {
        Cookie cookie = new Cookie("cookie", value);
        // ok
        cookie.setSecure(true);
        response.addCookie(cookie);
    }
    
    @RequestMapping(value = "/cookie", method = "GET")
    public void setSecureHttponlyCookie(@RequestParam String value, HttpServletResponse response) {
        Cookie cookie = new Cookie("cookie", value);
        // ok
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }
}