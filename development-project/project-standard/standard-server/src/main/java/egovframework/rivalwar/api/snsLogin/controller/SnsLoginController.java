package egovframework.rivalwar.api.snsLogin.controller;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-05-24.
 */

@Controller
@RequestMapping(value = { "/rivalWar/api/snsLogin" })
public class SnsLoginController extends GenericAbstractController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    @RequestMapping("/sessionInfoToJson.do")
    public String sessionInfoToJson() {
        return "egovframework/rivalWar/api/snsLogin/authCheck";
    }
}
