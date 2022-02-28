using System;
using System.Net;

namespace HttpListenerWildcard {
    class MyBadHttpListener {
        public static void HttpListenerWildcard() {
            HttpListener listener = new HttpListener();

            // ruleid: http-listener-wildcard-bindings
            listener.Prefixes.Add("http://*:8080");

            // ruleid: http-listener-wildcard-bindings
            listener.Prefixes.Add("http://+:8080");

            // ruleid: http-listener-wildcard-bindings
            listener.Prefixes.Add("https://*:8080");

            // ruleid: http-listener-wildcard-bindings
            listener.Prefixes.Add("https://+:8080");

            // ruleid: http-listener-wildcard-bindings
            listener.Prefixes.Add("https://*.com:8080");

            // ok
            listener.Prefixes.Add("https://0.0.0.0:8080");

            // ok
            listener.Prefixes.Add("http://www.contoso.com:8080/");

            // ok
            listener.Prefixes.Add("http://*.test.com:8080");

            listener.Start();
        }
    }
}
