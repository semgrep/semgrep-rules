package servlets

import java.io.File
import java.io.IOException
import java.io.PrintWriter

import javax.servlet.ServletException
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.http.HttpSession

public class Cls:HttpServlet
{
    private val log:org.apache.log4j.Logger = Logger.getLogger(Register.class)

    // cf. https://find-sec-bugs.github.io/bugs.htm#TDES_USAGE
    protected fun danger(req: HttpServletRequest, resp: HttpServletResponse) : Void {
        // ruleid: des-is-deprecated
        val c: Cipher = Cipher.getInstance("DES/ECB/PKCS5Padding")
        c.init(Cipher.ENCRYPT_MODE, k, iv)
        val cipherText= c.doFinal(plainText)
    }

    protected fun ok(req: HttpServletRequest, resp: HttpServletResponse) : Void {
        // ok: des-is-deprecated
        val c: Cipher = Cipher.getInstance("AES/GCM/NoPadding")
        c.init(Cipher.ENCRYPT_MODE, k, iv)
        val cipherText= c.doFinal(plainText)
    }
}
