class Bad {
    public static void badftp1() {
        String server = "www.yourserver.net";
        int port = 21;
        // ruleid: ftp-request
        FTPClient ftpClient = new FTPClient();
        ftpClient.connect(server, port);
    }

    public static void badftp2() {
        // ruleid: ftp-request
        URL url = new URL("ftp://user01:pass1234@ftp.foo.com/README.txt;type=i");
        URLConnection urlc = url.openConnection();
        InputStream is = urlc.getInputStream(); // To download
        OutputStream os = urlc.getOutputStream(); // To upload
    }
}

class Ok {
    public static void badftp2() {
        // ok: ftp-request
        URL url = new URL("sftp://user01:pass1234@ftp.foo.com/README.txt;type=i");
        URLConnection urlc = url.openConnection();
        InputStream is = urlc.getInputStream(); // To download
        OutputStream os = urlc.getOutputStream(); // To upload
    }
}
