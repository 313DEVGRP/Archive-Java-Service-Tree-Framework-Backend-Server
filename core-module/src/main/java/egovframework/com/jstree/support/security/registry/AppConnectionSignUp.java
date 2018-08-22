package egovframework.com.jstree.support.security.registry;

import egovframework.com.ext.jstree.support.security.dto.LocalUser;
import egovframework.com.ext.jstree.support.security.dto.SocialProvider;
import egovframework.com.ext.jstree.support.security.dto.UserRegistrationForm;
import egovframework.com.ext.jstree.support.security.service.UserService;
import egovframework.com.ext.jstree.support.security.util.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.social.connect.UserProfile;

public class AppConnectionSignUp implements ConnectionSignUp {

    @Autowired
    private UserService userService;

    @Autowired
    @Qualifier(value = "localUserDetailService")
    private UserDetailsService userDetailService;

    @Override
    public String execute(final Connection<?> connection) {
        UserRegistrationForm userDetails = toUserRegistrationObject(connection.getKey().getProviderUserId(), SecurityUtil.toSocialProvider(connection.getKey().getProviderId()), connection.fetchUserProfile());

        LocalUser checkToUser = (LocalUser) userDetailService.loadUserByUsername(userDetails.getUserId());
        if(null == checkToUser){
            LocalUser user = (LocalUser) userService.registerNewUser(userDetails);
            return user.getUserId();
        }else{
            return checkToUser.getUserId();
        }

    }

    private UserRegistrationForm toUserRegistrationObject(final String userId, final SocialProvider socialProvider, final UserProfile userProfile) {
        return UserRegistrationForm.getBuilder()
                .addUserId(userId)
                .addFirstName(userProfile.getName())
                .addEmail(userProfile.getEmail())
                .addPassword(userProfile.getName())
                .addSocialProvider(socialProvider).build();
    }

}
