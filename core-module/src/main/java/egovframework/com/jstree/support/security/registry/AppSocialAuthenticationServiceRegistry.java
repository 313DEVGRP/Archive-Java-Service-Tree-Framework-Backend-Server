package egovframework.com.jstree.support.security.registry;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.social.security.SocialAuthenticationServiceRegistry;
import org.springframework.social.security.provider.SocialAuthenticationService;

public class AppSocialAuthenticationServiceRegistry extends SocialAuthenticationServiceRegistry {

    private List<SocialAuthenticationService<?>> authenticationServices;

    public AppSocialAuthenticationServiceRegistry(final List<SocialAuthenticationService<?>> authenticationServices) {
        this.authenticationServices = authenticationServices;
    }

    @PostConstruct
    public void init() {
        if (authenticationServices != null) {
            for (SocialAuthenticationService authenticationService : authenticationServices) {
                super.addAuthenticationService(authenticationService);
            }
        }
    }

}
