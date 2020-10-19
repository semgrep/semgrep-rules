class Bad {
    public void badtelnet1() {
        //ruleid: telnet-request
        TelnetClient telnet = new TelnetClient();
        telnet.connect("rainmaker.wunderground.com");
    }

    public void badtelnet2() {
        TelnetClient telnet = null;
        //ruleid: telnet-request
        telnet = new TelnetClient();
        telnet.connect("rainmaker.wunderground.com");
    }
}
