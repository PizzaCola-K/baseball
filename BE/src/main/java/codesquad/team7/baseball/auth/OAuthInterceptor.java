package codesquad.team7.baseball.auth;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OAuthInterceptor implements HandlerInterceptor {

    private final JWTVerifier verifier;
    private final String TOKEN_TYPE = "Bearer";

    public OAuthInterceptor() {
        Algorithm algorithm = Algorithm.HMAC256("secret");
        verifier = JWT.require(algorithm)
                .withIssuer("baseball-game")
                .build();
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = getJwtToken(request);
        try {
            DecodedJWT jwt = verifier.verify(token);
            User user = new User();
            user.setLogin(jwt.getClaim("login").asString());
            user.setName(jwt.getClaim("name").asString());
            request.setAttribute("user", user);
            return true;
        } catch (JWTVerificationException exception){
            //Invalid signature/claims
            throw new RuntimeException(exception);
        }
    }

    private String getJwtToken(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");
        if (authorization.startsWith(TOKEN_TYPE)) {
            return authorization.substring(TOKEN_TYPE.length()).trim();
        }
        throw new RuntimeException("토큰 없음");
    }
}
