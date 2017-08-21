package egovframework.api.jsTreeServiceFramework.security.controller;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017-07-24.
 */
@Controller
@RequestMapping(value = {"/api/jsTreeServiceFramework/security"})
public class SecurityController extends GenericAbstractController {

    @IncludedInfo(name = "CSRF json", listUrl = "/api/jsTreeServiceFramework/security/csrf.do", order = 3300, gid = 313)
    @RequestMapping("/csrf.do")
    public String jsTreeCSRFtoJson() {
        return "egovframework/com/ext/jstree/csrf";
    }
}
