public class Bad {
    public void bad1() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.delete("http://example.com");
    }

    public void bad2() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://example.com";
        void hello = restTemplate.delete(url, object);
    }

    public void bad3() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        URI url = new URI("http://example.com");
        void hello = restTemplate.delete(url, object);
    }

    public void bad4() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.doExecute("http://example.com");
    }

    public void bad5() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://example.com";
        result = restTemplate.doExecute(url, object);
    }

    public void bad6() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        URI url = new URI("http://example.com");
        result = restTemplate.doExecute(url, object);
    }

    public void bad7() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String fooResourceUrl
        = "http://localhost:8080/spring-rest/foos";
        ResponseEntity<String> response
        = restTemplate.getForEntity(fooResourceUrl, String.class);
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    public void bad8() {
        // ruleid: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Foo> request = new HttpEntity<>(new Foo("bar"));
        String fooResourceUrl = "http://example.com";
        Foo foo = restTemplate.postForObject(fooResourceUrl, request, Foo.class);
        assertThat(foo, notNullValue());
        assertThat(foo.getName(), is("bar"));
    }

    public void bad9() {
        // ruleid: spring-http-request
        restTemplate template = new RestTemplate();
        Foo updatedInstance = new Foo("newName");
        updatedInstance.setId(createResponse.getBody().getId());
        String resourceUrl = "http://example.com";
        HttpEntity<Foo> requestUpdate = new HttpEntity<>(updatedInstance, headers);
        template.exchange(resourceUrl, HttpMethod.PUT, requestUpdate, Void.class);
    }
}

public class Ok {
    public void ok1() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.delete("https://example.com");
    }

    public void ok2() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://example.com";
        void hello = restTemplate.delete(url, object);
    }

    public void ok3() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        URI url = new URI("https://example.com");
        void hello = restTemplate.delete(url, object);
    }

    public void ok4() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.doExecute("https://example.com");
    }

    public void ok5() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://example.com";
        result = restTemplate.doExecute(url, object);
    }

    public void ok6() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        URI url = new URI("https://example.com");
        result = restTemplate.doExecute(url, object);
    }

    public void ok7() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        String fooResourceUrl
        = "https://localhost:8080/spring-rest/foos";
        ResponseEntity<String> response
        = restTemplate.getForEntity(fooResourceUrl, String.class);
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    public void ok8() {
        // ok: spring-http-request
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Foo> request = new HttpEntity<>(new Foo("bar"));
        String fooResourceUrl = "https://example.com";
        Foo foo = restTemplate.postForObject(fooResourceUrl, request, Foo.class);
        assertThat(foo, notNullValue());
        assertThat(foo.getName(), is("bar"));
    }

    public void ok9() {
        // ok: spring-http-request
        restTemplate template = new RestTemplate();
        Foo updatedInstance = new Foo("newName");
        updatedInstance.setId(createResponse.getBody().getId());
        String resourceUrl = "https://example.com";
        HttpEntity<Foo> requestUpdate = new HttpEntity<>(updatedInstance, headers);
        template.exchange(resourceUrl, HttpMethod.PUT, requestUpdate, Void.class);
    }
}
