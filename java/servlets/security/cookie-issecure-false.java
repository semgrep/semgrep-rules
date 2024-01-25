public class Bad {
          public void bad1() {
              // ruleid: cookie-issecure-false
              Cookie cookie = new Cookie("name", "value");
          }
   }

 public class Ok {
          public void ok1() {
             // ok: cookie-issecure-false
             Cookie cookie = new Cookie("name", "value");
             cookie.setSecure(true);
          }
}
