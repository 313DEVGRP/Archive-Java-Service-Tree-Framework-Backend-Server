package egovframework.com.ext.jstree.support.security.service;

import java.util.HashSet;

import egovframework.com.ext.jstree.support.security.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.com.ext.jstree.support.security.database.dao.UserDAO;
import egovframework.com.ext.jstree.support.security.database.model.Role;
import egovframework.com.ext.jstree.support.security.database.model.User;
import egovframework.com.ext.jstree.support.security.dto.LocalUser;
import egovframework.com.ext.jstree.support.security.dto.UserRegistrationForm;
import egovframework.com.ext.jstree.support.security.exception.UserAlreadyExistAuthenticationException;

/**
 * @author <a href="mailto:sunil.pulugula@wavemaker.com">Sunil Kumar</a>
 * @since 28/3/16
 */
@Service("registrationUserDetailService")
public class RegistrationUserDetailService implements UserService {

    @Autowired
    @Qualifier(value = "localUserDetailService")
    private UserDetailsService userDetailService;

    @Autowired
    private UserDAO userDAO;


    @Override
    @Transactional(value = "transactionManager")
    public LocalUser registerNewUser(final UserRegistrationForm userRegistrationForm) throws UserAlreadyExistAuthenticationException {

        User userExist = userDAO.get(userRegistrationForm.getUserId());
        if (userExist != null) {
            throw new UserAlreadyExistAuthenticationException("User with email id " + userRegistrationForm.getEmail() + " already exist");
        }

        User user = buildUser(userRegistrationForm);
        userDAO.save(user);
        userDAO.flush();

        return (LocalUser) userDetailService.loadUserByUsername(userRegistrationForm.getUserId());
    }

    private User buildUser(final UserRegistrationForm formDTO) {
        User user = new User();
        user.setUserId(formDTO.getUserId());
        user.setEmailId(formDTO.getEmail());
        user.setName(formDTO.getFirstName());
        user.setPassword(formDTO.getPassword());
        final HashSet<Role> roles = new HashSet<Role>();
        Role role = new Role();
        role.setName("ROLE_USER");
        roles.add(role);
        user.setRoles(roles);
        user.setActive(1);
        user.setProvider(formDTO.getSocialProvider().name());
        return user;
    }
}
