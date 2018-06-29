package egovframework.com.ext.jstree.support.security.service;

import org.springframework.security.core.userdetails.UserDetails;

import egovframework.com.ext.jstree.support.security.dto.UserRegistrationForm;
import egovframework.com.ext.jstree.support.security.exception.UserAlreadyExistAuthenticationException;

public interface UserService {

    public UserDetails registerNewUser(UserRegistrationForm UserRegistrationForm)throws UserAlreadyExistAuthenticationException;

}
