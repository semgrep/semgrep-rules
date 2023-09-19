fn tcp_bind_any_port() {
    //ruleid: avoid-bind-to-all-interfaces
    let _ = TcpListener::bind("0.0.0.0:80");
}

fn tcp_bind_any_port1() {
    //ruleid: avoid-bind-to-all-interfaces
    let _ = TcpListener::bind(":80");
}

fn udp_bind_any_port() {
    //ruleid: avoid-bind-to-all-interfaces
    let _ = UdpSocket::bind("0.0.0.0:80");
}

fn udp_bind_any_port1() {
    //ruleid: avoid-bind-to-all-interfaces
    let _ = UdpSocket::bind(":80");
}

fn socket_addr() {
    let addrs = [
        //ruleid: avoid-bind-to-all-interfaces
        SocketAddr::from(([0, 0, 0, 0], 80)),
        //ruleid: avoid-bind-to-all-interfaces
        SocketAddr::from(([0, 0, 0, 0], 443)),
    ];
}

fn ipv4_addr() {
    //ruleid: avoid-bind-to-all-interfaces
    let _ = Ipv4Addr::new(0, 0, 0, 0);
}

fn valid_entries() {
    let _ = TcpListener::bind("192.168.1.1:2000");
    let _ = UdpSocket::bind("192.168.1.1:2000");
    let _ = SocketAddr::from(([192, 168, 1, 1], 80));
    let _ = Ipv4Addr::new(192, 168, 1, 1);
}
