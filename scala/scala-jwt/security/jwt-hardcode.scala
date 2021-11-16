package jwt_test.jwt_test_1

import com.auth0.jwt.JWT
import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.exceptions.JWTCreationException

object App {
    val secret = "secret"
}

class App {

    def bad1() = {
        try {
            // ruleid: scala-jwt-hardcoded-secret
            Algorithm algorithm = Algorithm.HMAC256("secret");
            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);
        } catch (exception: JWTCreationException){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
    }

    def ok1(secretKey: String) = {
        try {
            // ok: scala-jwt-hardcoded-secret
            Algorithm algorithm = Algorithm.HMAC256(secretKey);
            String token = JWT.create()
                .withIssuer("auth0")
                .sign(algorithm);
        } catch (exception: JWTCreationException){
            //Invalid Signing configuration / Couldn't convert Claims.
        }
    }
}
