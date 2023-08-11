let prefs = WKPreferences()
// ruleid: swift-webview-config-allows-js-open-windows
prefs.JavaScriptCanOpenWindowsAutomatically  = true
let config = WKWebViewConfiguration()
config.defaultWebpagePreferences = prefs

WKWebView(frame: .zero, configuration: config)

let prefs2 = WKPreferences()
prefs2.JavaScriptCanOpenWindowsAutomatically  = true
// okid: swift-webview-config-allows-js-open-windows
prefs2.JavaScriptCanOpenWindowsAutomatically  = false
let config = WKWebViewConfiguration()
config.defaultWebpagePreferences = prefs2

WKWebView(frame: .zero, configuration: config)