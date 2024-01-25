public class Bad {

          public void bad2() {
              Cookie cookie = new Cookie("name", "value");
              // ruleid: cookie-setSecure
              cookie.setSecure(false);
          }
   }

 public class Ok {
          public void ok1() {
             // ok: cookie-setSecure
             Cookie cookie = new Cookie("name", "value");
             cookie.setSecure(true);
          }
}
