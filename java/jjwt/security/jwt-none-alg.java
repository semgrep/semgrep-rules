package jwt_test.jwt_test_1;

import java.security.Key;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

public class App
{

    private static void bad1() {
        // ruleid: jjwt-none-alg
        String jws = Jwts.builder()
                .setSubject("Bob")
                .compact();
    }

    private static void ok1() {
        Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
        // ok: jjwt-none-alg
        String jws = Jwts.builder()
                .setSubject("Bob")
                .signWith(key)
                .compact();
    }

    // https://github.com/semgrep/semgrep-rules/issues/3759
    private static void bad2(boolean shouldSign) {
        String jws;
        if (shouldSign) {
            Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
            // ok: jjwt-none-alg
            jws = Jwts.builder()
                    .setSubject("Bob")
                    .signWith(key)
                    .compact();
        } else {
            // ruleid: jjwt-none-alg
            jws = Jwts.builder()
                    .setSubject("Bob")
                    .compact();
        }
    }

    private static void ok2() {
        Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
        // ok: jjwt-none-alg
        JwtBuilder builder = Jwts.builder();
        builder.setSubject("Bob");
        String jws = builder.signWith(key).compact();
    }

    private static void bad3() {
        // ruleid: jjwt-none-alg
        JwtBuilder builder = Jwts.builder();
        builder.setSubject("Bob");
        String jws = builder.compact();
    }

    public static void main( String[] args )
    {
        bad1();
        ok1();
        bad2(true);
        ok2();
        bad3();
    }
}
