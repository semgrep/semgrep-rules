class Bad {
    public void sendbad1() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ruleid: httpclient-http-request
            .uri(URI.create("http://openjdk.java.net/"))
            .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }

    public void sendbad2() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ruleid: httpclient-http-request
            .uri(URI.create("http://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }

    public void sendbad3() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ruleid: httpclient-http-request
            .uri(URI.create("http://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        HttpResponse<String> response =
            client.send(request, BodyHandlers.ofString());
    }

    public void sendbad4() {
        HttpClient client = HttpClient.newBuilder()
            .version(Version.HTTP_2)
            .followRedirects(Redirect.SAME_PROTOCOL)
            .proxy(ProxySelector.of(new InetSocketAddress("www-proxy.com", 8080)))
            .authenticator(Authenticator.getDefault())
            .build();
        HttpRequest request = HttpRequest.newBuilder()
            // ruleid: httpclient-http-request
            .uri(URI.create("http://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        HttpResponse<String> response =
            client.send(request, BodyHandlers.ofString());
    }

    public void sendbad5() {
        String uri = "http://openjdk.java.net/";
        HttpClient client = HttpClient.newBuilder().build();
        HttpRequest request = HttpRequest.newBuilder()
                // ruleid: httpclient-http-request
                .uri(URI.create(uri))
                .POST(BodyPublishers.ofString(data))
                .build();

        HttpResponse<?> response = client.send(request, BodyHandlers.discarding());
        System.out.println(response.statusCode());
    }


    public void sendbad6() {
        String uri = "http://openjdk.java.net/";
        HttpClient client = HttpClient.newBuilder().build();
        HttpRequest request = HttpRequest.newBuilder()
                // ruleid: httpclient-http-request
                .uri(URI.create(uri))
                .POST(BodyPublishers.ofString(data))
                .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }
}

class Ok {
    public void sendok1() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ok: httpclient-http-request
            .uri(URI.create("https://openjdk.java.net/"))
            .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }

    public void sendok2() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ok: httpclient-http-request
            .uri(URI.create("https://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }

    public void sendok3() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            // ok: httpclient-http-request
            .uri(URI.create("https://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        HttpResponse<String> response =
            client.send(request, BodyHandlers.ofString());
    }

    public void sendok4() {
        HttpClient client = HttpClient.newBuilder()
            .version(Version.HTTP_2)
            .followRedirects(Redirect.SAME_PROTOCOL)
            .proxy(ProxySelector.of(new InetSocketAddress("www-proxy.com", 8080)))
            .authenticator(Authenticator.getDefault())
            .build();
        HttpRequest request = HttpRequest.newBuilder()
            // ok: httpclient-http-request
            .uri(URI.create("https://openjdk.java.net/"))
            .timeout(Duration.ofMinutes(1))
            .header("Content-Type", "application/json")
            .POST(BodyPublishers.ofFile(Paths.get("file.json")))
            .build();

        HttpResponse<String> response =
            client.send(request, BodyHandlers.ofString());
    }

    public void sendok5() {
        String uri = "https://openjdk.java.net/";
        HttpClient client = HttpClient.newBuilder().build();
        HttpRequest request = HttpRequest.newBuilder()
                // ok: httpclient-http-request
                .uri(URI.create(uri))
                .POST(BodyPublishers.ofString(data))
                .build();

        HttpResponse<?> response = client.send(request, BodyHandlers.discarding());
        System.out.println(response.statusCode());
    }


    public void sendok6() {
        String uri = "https://openjdk.java.net/";
        HttpClient client = HttpClient.newBuilder().build();
        HttpRequest request = HttpRequest.newBuilder()
                // ok: httpclient-http-request
                .uri(URI.create(uri))
                .POST(BodyPublishers.ofString(data))
                .build();

        client.sendAsync(request, BodyHandlers.ofString())
            .thenApply(HttpResponse::body)
            .thenAccept(System.out::println)
            .join();
    }
}
