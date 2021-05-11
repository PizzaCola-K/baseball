package codesquad.team7.baseball.config;

import codesquad.team7.baseball.auth.OAuthInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new OAuthInterceptor())
                .addPathPatterns("/games/{gameId}/**").excludePathPatterns("/games/{gameId}");
    }
}
