package egovframework.rivalwar.api.snsLogin.service;

import egovframework.com.sec.rgm.service.AuthorGroup;
import org.springframework.social.facebook.api.User;

public interface FacebookLoginService {

    public String getUserIdByLoginAndRegisterProcess(User facebookProfile, AuthorGroup authorGroup) throws Exception;

}