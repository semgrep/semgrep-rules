package jwt_test.jwt_test_1;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;

public class App
{

    private static void bad1() {
        try {
            // ruleid: java-jwt-none-alg
            Algorithm algorithm = Algorithm.none();
            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);
        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
    }

    private static void bad2() {
        try {
            // ruleid: java-jwt-none-alg
            String token = JWT.create()
                .withIssuer("auth0")
                .sign(Algorithm.none());
        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
    }

    private static void ok1(String secretKey) {
        try {
            // ok: java-jwt-none-alg
            Algorithm algorithm = Algorithm.HMAC256(secretKey);
            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);
        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
    }

    public static void main( String[] args )
    {
        bad1();
        bad2();
        ok1(args[0]);
    }
}
