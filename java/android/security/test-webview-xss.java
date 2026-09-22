import android.webkit.WebView;

public class Test {
    // ruleid: android-webview-javascript-enabled-xss
    public void vulnerableXss(WebView view) {
        view.getSettings().setJavaScriptEnabled(true);
    }

    // ok: android-webview-javascript-enabled-xss
    public void safeXss(WebView view) {
        view.getSettings().setJavaScriptEnabled(false);
    }

    // ruleid: android-webview-file-access
    public void vulnerableFileAccess(WebView view) {
        view.getSettings().setAllowFileAccess(true);
    }

    // ok: android-webview-file-access
    public void safeFileAccess(WebView view) {
        view.getSettings().setAllowFileAccess(false);
    }

    // ruleid: android-webview-universal-access
    public void vulnerableUniversalAccess(WebView view) {
        view.getSettings().setAllowUniversalAccessFromFileURLs(true);
    }

    // ok: android-webview-universal-access
    public void safeUniversalAccess(WebView view) {
        view.getSettings().setAllowUniversalAccessFromFileURLs(false);
    }
}
