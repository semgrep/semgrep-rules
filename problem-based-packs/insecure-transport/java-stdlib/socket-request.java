class Bad {
    public void badsocket1() {
        // ruleid: socket-request
        pingSocket = new Socket("telnet://example.com", 23);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void badsocket2() {
        // ruleid: socket-request
        pingSocket = new Socket("ftp://example.com", 21);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void badsocket3() {
        // ruleid: socket-request
        pingSocket = new Socket("http://example.com", 80);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void badsocket4() {
        String servername = "telnet://example.com";
        // ruleid: socket-request
        pingSocket = new Socket(servername, 23);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void badsocket5() {
        String servername = "ftp://example.com";
        // ruleid: socket-request
        pingSocket = new Socket(servername, 23);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void badsocket6() {
        String servername = "http://example.com";
        // ruleid: socket-request
        pingSocket = new Socket(servername, 23);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }
}

class Ok {
    public void oksocket1() {
        // ok: socket-request
        pingSocket = new Socket("ssh://example.com", 22);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void oksocket2() {
        // ok: socket-request
        pingSocket = new Socket("sftp://example.com", 22);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void oksocket3() {
        // ok: socket-request
        pingSocket = new Socket("https://example.com", 443);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void oksocket4() {
        String servername = "ssh://example.com";
        // ok: socket-request
        pingSocket = new Socket(servername, 22);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void oksocket5() {
        String servername = "sftp://example.com";
        // ok: socket-request
        pingSocket = new Socket(servername, 23);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }

    public void oksocket6() {
        String servername = "https://example.com";
        // ok: socket-request
        pingSocket = new Socket(servername, 443);
        out = new PrintWriter(pingSocket.getOutputStream(), true);
        in = new BufferedReader(new InputStreamReader(pingSocket.getInputStream()));

            out.println("ping");
            System.out.println(in.readLine());
            out.close();
            in.close();
            pingSocket.close();
    }
}
