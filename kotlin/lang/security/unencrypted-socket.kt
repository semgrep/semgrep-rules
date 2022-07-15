package testcode.crypto

import javax.net.ssl.SSLServerSocketFactory
import java.io.*
import java.net.InetAddress
import java.net.Socket
import java.net.ServerSocket

public class UnencryptedSocket {

    fun sslSocket(): Void {
        // ok: unencrypted-socket
        val soc:Socket = SSLSocketFactory.getDefault().createSocket("www.google.com", 443)
        doGetRequest(soc)
    }

    fun plainSocket(): Void {
        // ruleid: unencrypted-socket
        val soc: Socket = Socket("www.google.com", 80)
        doGetRequest(soc)
    }

    fun byteArrayOfInts(vararg ints: Int) = ByteArray(ints.size) { pos -> ints[pos].toByte() }

    fun otherConstructors(): Void {
        // ruleid: unencrypted-socket
        val soc1: Socket = Socket("www.google.com", 80, true)
        doGetRequest(soc1)
        val address: ByteArray = byteArrayOfInts(127, 0, 0, 1)
        // ruleid: unencrypted-socket
        val soc2: Socket = Socket("www.google.com", 80, InetAddress.getByAddress(address), 13337)
        doGetRequest(soc2)
        val remoteAddress: ByteArray = byteArrayOfInts(74, 125, toByte(226), toByte(193))
        // ruleid: unencrypted-socket
        val soc3: Socket = Socket(InetAddress.getByAddress(remoteAddress), 80)
        doGetRequest(soc2)
    }

    fun doGetRequest(soc: Socket): Void {
        System.out.println("")
        soc.close()
    }
}

public class UnencryptedServerSocket {

    fun sslServerSocket(): Void {
        // ok: unencrypted-socket
        val ssoc: ServerSocket = SSLServerSocketFactory.getDefault().createServerSocket(1234)
        ssoc.close()
    }

    fun plainServerSocket(): Void {
        // ruleid: unencrypted-socket
        val ssoc: ServerSocket = ServerSocket(1234)
        ssoc.close()
    }

    fun byteArrayOfInts(vararg ints: Int) = ByteArray(ints.size) { pos -> ints[pos].toByte() }

    fun otherConstructors(): Void {
        // ruleid: unencrypted-socket
        val ssoc1: ServerSocket = ServerSocket()
        ssoc1.close()
        // ruleid: unencrypted-socket
        val ssoc2: ServerSocket = ServerSocket(1234, 10)
        ssoc2.close()
        val address: ByteArray = byteArrayOfInts(127, 0, 0, 1)
        // ruleid: unencrypted-socket
        val ssoc3: ServerSocket = ServerSocket(1234, 10, InetAddress.getByAddress(address))
        ssoc3.close()
    }

}
