package jwt_test.jwt_test_1;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

public class App
{

    private void verifyToken(String token, String secret) {
        Algorithm algorithm = Algorithm.HMAC256(secret);
        JWTVerifier verifier = JWT.require(algorithm)
                .withIssuer("auth0")
                .build(); //Reusable verifier instance
        DecodedJWT jwt2 = verifier.verify(token);
    }

    public void ok( String[] args )
    {
        System.out.println( "Hello World!" );

        try {
            Algorithm algorithm = Algorithm.HMAC256(args[0]);

            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);

            DecodedJWT jwt = JWT.decode(token);

        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }

    }
}

abstract class App2
{

    private void bad( String[] args )
    {
        System.out.println( "Hello World!" );

        try {
            Algorithm algorithm = Algorithm.none();

            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);
            // ruleid: java-jwt-decode-without-verify
            DecodedJWT jwt = JWT.decode(token);

        } catch (JWTCreationException exception){
            //Invalid Signing configuration / Couldn't convert Claims.
        }

    }
}
