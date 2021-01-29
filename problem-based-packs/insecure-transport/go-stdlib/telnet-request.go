func bad1() {
    var caller telnet.Caller = telnet.StandardCaller

	// ruleid: telnet-request
	telnet.DialToAndCall("example.net:23", caller)
}

func ok1() {
	tlsConfig := &tls.Config{}

	var caller telnet.Caller = telnet.StandardCaller

	// ok: telnet-request
	telnet.DialToAndCallTLS("example.net:992", caller, tlsConfig)
}
