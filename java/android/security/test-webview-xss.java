import android.webkit.WebView;

public class Test {
    // ruleid: android-webview-javascript-enabled-xss
    public void vulnerableWebView(WebView view) {
        view.getSettings().setJavaScriptEnabled(true);
    }

    // ok: android-webview-javascript-enabled-xss
    public void safeWebView(WebView view) {
        view.getSettings().setJavaScriptEnabled(false);
    }
}
