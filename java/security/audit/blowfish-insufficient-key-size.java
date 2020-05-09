import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

// cf. https://find-sec-bugs.github.io/bugs.htm#BLOWFISH_KEY_SIZE
public class Cls {

    public void unsafeKeySize() {
        KeyGenerator keyGen = KeyGenerator.getInstance("Blowfish");
        keyGen.init(64);
    }

    public void safeKeySize() {
        KeyGenerator keyGen = KeyGenerator.getInstance("Blowfish");
        keyGen.init(128);
    }

    public void superSafeKeySize() {
        KeyGenerator keyGen = KeyGenerator.getInstance("Blowfish");
        keyGen.init(448);
    }
}
