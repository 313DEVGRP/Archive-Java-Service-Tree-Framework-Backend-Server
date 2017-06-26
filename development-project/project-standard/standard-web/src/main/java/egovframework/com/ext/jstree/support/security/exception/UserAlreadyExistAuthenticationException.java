package egovframework.com.ext.jstree.support.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * @author <a href="mailto:sunil.pulugula@wavemaker.com">Sunil Kumar</a>
 * @since 28/3/16
 */
public class UserAlreadyExistAuthenticationException extends AuthenticationException {

    public UserAlreadyExistAuthenticationException(final String msg) {
        super(msg);
    }

}
