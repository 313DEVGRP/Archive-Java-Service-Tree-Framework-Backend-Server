package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_GetChildNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

@Service("S_GetChildNode")
public class S_GetChildNode implements I_S_GetChildNode {

    static Logger logger = Logger.getLogger(S_GetChildNode.class);

    HttpServletRequest request;

    @Resource(name = "DB_GetChildNode")
    I_DB_GetChildNode i_DB_GetChildNode;

    public S_GetChildNode() {
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public List<T_ComprehensiveTree> getChildNode(P_ComprehensiveTree p_ComprehensiveTree) {
        String determineDBSetting = selectDBSetting("byID");
        return i_DB_GetChildNode.getChildNode(p_ComprehensiveTree, determineDBSetting);
    }


    @Override
    public List<T_ComprehensiveTree> getChildNodeByLeftRight(P_ComprehensiveTree p_ComprehensiveTree) {

        String determineDBSetting = selectDBSetting("byLeftRight");
        return i_DB_GetChildNode.getChildNodeByLeftRight(p_ComprehensiveTree, determineDBSetting);
    }

    public String selectDBSetting(String flag) {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/getChildNode.action".equals(request.getRequestURI()) && "byID".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/alterNodeType.action".equals(request.getRequestURI()) && "byID".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/moveNode.action".equals(request.getRequestURI()) && "byID".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/moveNode.action".equals(request.getRequestURI()) && "byLeftRight".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNodeByLeftRight";
        } else if ("/com/ext/jstree/strutsiBatis/core/addNode.action".equals(request.getRequestURI()) && "byID".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNode";
        } else if ("/com/ext/jstree/strutsiBatis/core/addNode.action".equals(request.getRequestURI()) && "byLeftRight".equals(flag)) {
            returnStr = "jstreeStrutsiBatis.getChildNodeByLeftRight";
        } else {
            logger.debug(request.getRequestURI());
        }
        return returnStr;
    }

}
