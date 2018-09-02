package egovframework.com.ext.jstree.support.util;

import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018-09-01.
 */
@Controller
@RequestMapping(value = {"/com/ext/jstree/codeGenerator"})
public class CodeGenerator extends GenericAbstractController {

    @IncludedInfo(name = "Code-Generator", listUrl = "/com/ext/jstree/codeGenerator/index.do", order = 3370, gid = 313)
    @RequestMapping("/index.do")
    public String jsTreeSpringHibernate() {
        return "egovframework/com/ext/jstree/codeGenerator/index";
    }
}
