class Bad {
    public void bad1() {
        // ruleid: unirest-http-request
        HttpResponse<JsonNode> response = Unirest.post("http://httpbin.org/post")
            .header("accept", "application/json")
            .queryString("apiKey", "123")
            .field("parameter", "value")
            .field("firstname", "Gary")
            .asJson();
    }

    public void bad2() {
        // ruleid: unirest-http-request
        Unirest.get("http://httpbin.org")
            queryString("fruit", "apple")
            .queryString("droid", "R2D2")
            .asString();
    }
}

class Ok {
    public void ok1() {
        // ok: unirest-http-request
        HttpResponse<JsonNode> response = Unirest.post("https://httpbin.org/post")
            .header("accept", "application/json")
            .queryString("apiKey", "123")
            .field("parameter", "value")
            .field("firstname", "Gary")
            .asJson();
    }

    public void ok2() {
        // ok: unirest-http-request
        Unirest.get("https://httpbin.org")
            queryString("fruit", "apple")
            .queryString("droid", "R2D2")
            .asString();
    }
}
