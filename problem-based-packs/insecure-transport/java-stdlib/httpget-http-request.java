package Test;

import java.io.*;
import java.net.*;
import java.util.*;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.methods.HttpGet;

class Bad {
    private static void sendbad1() throws IOException {
        // ruleid: httpget-http-request
        HttpGet httpGet = new HttpGet("http://example.com");
        HttpClients.createDefault().execute(httpGet);
    }

    private static void sendbad2() throws IOException {
        String url = "http://example.com";
        // ruleid: httpget-http-request
        HttpGet httpGet = new HttpGet(url); 
        HttpClients.createDefault().execute(httpGet);
    }
}

public class Ok {
    private static void sendok1() throws IOException {
        // ok: httpget-http-request
        HttpGet httpGet = new HttpGet("https://example.com");
        HttpClients.createDefault().execute(httpGet);
    }

    private static void sendok2() throws IOException {
        String url = "https://example.com";
        // ok: httpget-http-request
        HttpGet httpGet = new HttpGet(url); 
        HttpClients.createDefault().execute(httpGet);
    }
}
