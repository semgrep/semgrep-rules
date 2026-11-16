package testcode;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UnvalidatedRedirectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getParameter("urlRedirect");
        unvalidatedRedirect1(resp, url);
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirect1(HttpServletResponse resp, String url) throws IOException {
        if (url != null) {
            resp.sendRedirect(url);
        }
    }

    // ruleid: unvalidated-redirect
    public void unvalidatedRedirect2(HttpServletResponse resp, String url) {
        if (url != null) {
            resp.addHeader("Location", url);
        }
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirect3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getParameter("urlRedirect"));
    }

    // ruleid: unvalidated-redirect
    public void unvalidatedRedirect4(HttpServletRequest req, HttpServletResponse resp) {
        String url = req.getParameter("urlRedirect");
        resp.addHeader("Location", url);
    }

    // ok: unvalidated-redirect
    public void falsePositiveRedirect1(HttpServletResponse resp) throws IOException {
        String url = "/Home";
        if (url != null) {
            resp.sendRedirect(url);
        }
    }

    // ok: unvalidated-redirect
    public void falsePositiveRedirect2(HttpServletResponse resp) {
        resp.addHeader("Location", "/login.jsp");
    }

    // Helper-returned redirect targets (fixes #3822, duplicate #3834).
    // The redirect target is read from the request inside getContinueToURL
    // and only reaches the sink through the helper return value.

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String continueToURL = getContinueToURL(req);
        resp.sendRedirect(resp.encodeRedirectURL(continueToURL));
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper2(HttpServletResponse resp, HttpServletRequest req) throws IOException {
        String continueToURL = getContinueToURL(req);
        resp.sendRedirect(continueToURL);
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(getContinueToURL(req));
    }

    // ruleid: unvalidated-redirect
    public void unvalidatedRedirectHelper4(HttpServletRequest req, HttpServletResponse resp) {
        String continueToURL = getContinueToURL(req);
        resp.addHeader("Location", continueToURL);
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper5(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String continueToURL = getRedirectTarget(req, "/home");
        resp.sendRedirect(continueToURL);
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper6(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(resp.encodeRedirectURL(getContinueToURL(req)));
    }

    // ruleid: unvalidated-redirect
    private void unvalidatedRedirectHelper7(SecurityRequestWrapper req, HttpServletResponse resp) throws IOException {
        String continueToURL = getContinueToURL(req);
        resp.sendRedirect(resp.encodeRedirectURL(continueToURL));
    }

    private String getContinueToURL(HttpServletRequest request) {
        String savedURL = request.getParameter("xredirect");
        if (savedURL == null) {
            savedURL = "/home";
        }
        return savedURL;
    }

    private String getRedirectTarget(HttpServletRequest request, String fallback) {
        String target = request.getParameter("next");
        if (target == null) {
            target = fallback;
        }
        return target;
    }

    // ok: unvalidated-redirect
    public void falsePositiveRedirectHelper1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String url = getDefaultPage();
        resp.sendRedirect(url);
    }

    // ok: unvalidated-redirect
    public void falsePositiveRedirectHelper2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String url = getContinueToURL(req);
        resp.sendRedirect("/home");
    }

    private String getDefaultPage() {
        return "/home";
    }
}
