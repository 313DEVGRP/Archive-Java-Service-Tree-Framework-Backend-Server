package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_GetNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("S_GetNode")
public class S_GetNode implements I_S_GetNode {

    static Logger logger = Logger.getLogger(S_GetChildNode.class);
    HttpServletRequest request;

    @Resource(name = "DB_GetNode")
    I_DB_GetNode i_DB_GetNode;


    public S_GetNode() {
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree, String flag) {
        String determineDBSetting = this.selectDBSetting(flag);
        return i_DB_GetNode.getNode(p_ComprehensiveTree, determineDBSetting);
    }

    @Override
    public T_ComprehensiveTree getNodeByRef(P_ComprehensiveTree p_ComprehensiveTree, String flag) {
        String determineDBSetting = this.selectDBSetting(flag);
        return i_DB_GetNode.getNodeByRef(p_ComprehensiveTree, determineDBSetting);
    }

    public String selectDBSetting(String flag) {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/removeNode.action".equals(request.getRequestURI()) && "remove".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/moveNode.action".equals(request.getRequestURI()) && "getNode".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/moveNode.action".equals(request.getRequestURI()) && "getNodeByRef".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNodeByRef";
        } else if ("/com/ext/jstree/strutsiBatis/core/addNode.action".equals(request.getRequestURI()) && "getNode".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/addNode.action".equals(request.getRequestURI()) && "getNodeByRef".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNodeByRef";
        } else if ("/com/ext/jstree/strutsiBatis/core/alterNodeType.action".equals(request.getRequestURI()) && "getNode".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getNode";
        } else {
            logger.debug(request.getRequestURI());
            throw new RuntimeException();
        }
        return returnStr;
    }

}
