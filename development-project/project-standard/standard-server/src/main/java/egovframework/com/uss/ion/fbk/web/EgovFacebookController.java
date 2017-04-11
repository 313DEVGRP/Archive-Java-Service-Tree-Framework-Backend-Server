/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Simple little @Controller that invokes Facebook and renders the result.
 * The injected {@link Facebook} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Keith Donald
 */
package egovframework.com.uss.ion.fbk.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.util.StringUtils;
import egovframework.com.sec.rgm.service.AuthorGroup;
import egovframework.rivalwar.api.snsLogin.service.FacebookLoginService;
import egovframework.rte.fdl.property.EgovPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

/**
 * Facebook을 처리하는 Controller Class 구현
 *
 * @author 표준프레임워크센터
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일     	수정자          		      수정내용
 *  -----------    --------------------    ---------------------------
 *  2014.11.10		표준프레임워크센터		      최초 생성
 *  </pre>
 * @since 2014.11.10
 */
@Controller
public class EgovFacebookController {

    private final Facebook facebook;

    @Autowired
    private FacebookLoginService facebookLoginService;

    @Inject
    public EgovFacebookController(Facebook facebook) {
        this.facebook = facebook;
    }

    @Inject
    private ConnectionRepository connectionRepository;


    /**
     * EgovMessageSource
     */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /**
     * EgovPropertyService
     */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;


    /**
     * facebook 연동을 위한 목록을 보여준다.
     *
     * @return String - 리턴 Url
     */
    @IncludedInfo(name = "Facebook 연동", order = 831, gid = 50)
    @RequestMapping(value = "/uss/ion/fbk/facebook.do", method = RequestMethod.GET)
    public String home(HttpServletRequest request, SessionStatus status, @ModelAttribute("authorGroup") AuthorGroup authorGroup) throws Exception {

        //original code = return "egovframework/com/uss/ion/fbk/EgovFacebookHome";

        Connection<Facebook> connection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (connection == null) {
            return "redirect:/connect/facebook";
        }

        //FacebookProfile facebookAccount = connection.getApi().userOperations().getUserProfile();
        User facebookAccount = connection.getApi().userOperations().getUserProfile();

        //User facebookAccount = new User("123","123","!23","123", "123", Locale.KOREA);
        String resultString = facebookLoginService.getUserIdByLoginAndRegisterProcess(facebookAccount, authorGroup);
        status.setComplete();
        request.getSession().setAttribute("userSe", "GNR");
        request.getSession().setAttribute("socialLoginType", "facebook");
        request.getSession().setAttribute("id", facebookAccount.getId());
        if (StringUtils.equals(resultString, "needTheNickname")) {
            request.getSession().setAttribute("resultString", "needTheNickname");
            return "egovframework/com/uss/ion/fbk/EgovFacebookHome";
        } else if (StringUtils.equals(resultString, "joinedAccount")) {
            request.getSession().setAttribute("resultString", "joinedAccount");
            return "egovframework/com/uss/ion/fbk/EgovFacebookHome";
        } else {
            request.getSession().setAttribute("resultString", "insertAccount");
            return "egovframework/com/uss/ion/fbk/EgovFacebookHome";
        }
    }

    /**
     * facebook 담벼락 목록을 보여준다.
     *
     * @return String - 리턴 Url
     */
    @IncludedInfo(name = "RivalWar Admin Facebook Login",
            listUrl = "/uss/ion/fbk/facebookSignin.do",
            order = 7002,
            gid = 3131)
    @RequestMapping(value = "/uss/ion/fbk/facebookSignin.do", method = RequestMethod.GET)
    public String facebookSignin(Model model) {
        return "egovframework/com/uss/ion/fbk/EgovFacebookSignin";
    }


    @RequestMapping(value = "/uss/ion/fbk/feed.do", method = RequestMethod.GET)
    public String showFeed(Model model) {
        model.addAttribute("feed", facebook.feedOperations().getFeed());
        return "egovframework/com/uss/ion/fbk/EgovFacebookFeed";
    }

    /**
     * facebook 담벼락 내용을 입력한다.
     *
     * @return String - 리턴 Url
     */
    @RequestMapping(value = "/uss/ion/fbk/feed.do", method = RequestMethod.POST)
    public String postUpdate(String message) {
        facebook.feedOperations().updateStatus(message);
        return "redirect:/uss/ion/fbk/feed.do";
    }

    /**
     * facebook 앨범 목록을 보여준다.
     *
     * @return String - 리턴 Url
     */
    @RequestMapping(value = "/uss/ion/fbk/albums.do", method = RequestMethod.GET)
    public String showAlbums(Model model) {
        model.addAttribute("albums", facebook.mediaOperations().getAlbums());
        return "egovframework/com/uss/ion/fbk/EgovFacebookAlbums";
    }

    /**
     * facebook 앨범을 보여준다.
     *
     * @return String - 리턴 Url
     */
    @RequestMapping(value = "/uss/ion/fbk/album/{albumId}", method = RequestMethod.GET)
    public String showAlbum(@PathVariable("albumId") String albumId, Model model) {
        model.addAttribute("album", facebook.mediaOperations().getAlbum(albumId));
        model.addAttribute("photos", facebook.mediaOperations().getPhotos(albumId));
        return "egovframework/com/uss/ion/fbk/EgovFacebookAlbum";
    }

    /**
     * facebook profile을 보여준다.
     *
     * @return String - 리턴 Url
     */
    @RequestMapping(value = "/uss/ion/fbk/profile.do", method = RequestMethod.GET)
    public String profile(Model model) {
        Connection<Facebook> connection = connectionRepository.findPrimaryConnection(Facebook.class);
        if (connection == null) {
            return "redirect:/connect/facebook";
        }
        model.addAttribute("profile", connection.getApi().userOperations().getUserProfile());
        return "egovframework/com/uss/ion/fbk/EgovFacebookProfile";
    }

}
