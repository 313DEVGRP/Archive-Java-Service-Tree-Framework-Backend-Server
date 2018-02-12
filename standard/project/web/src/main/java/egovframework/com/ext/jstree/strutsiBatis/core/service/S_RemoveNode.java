package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_RemoveNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("S_RemoveNode")
public class S_RemoveNode implements I_S_RemoveNode {

    HttpServletRequest request;
    static Logger logger = Logger.getLogger(S_RemoveNode.class);

    @Resource(name = "DB_RemoveNode")
    I_DB_RemoveNode i_DB_RemoveNode;

    @Resource(name = "S_GetNode")
    I_S_GetNode i_s_GetNode;

    public S_RemoveNode() {
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;

    }

    @Override
    public int executeRemoveNode(P_ComprehensiveTree p_ComprehensiveTree) {

        i_s_GetNode.setRequest(request);
        return removeNode(Util_SwapNode.swapTtoP(i_s_GetNode.getNode(
                p_ComprehensiveTree, "remove")));
    }

    @Override
    public int removeNode(P_ComprehensiveTree p_RemoveNode) {

        int spaceOfTargetNode = p_RemoveNode.getC_right() - p_RemoveNode.getC_left() + 1;
        p_RemoveNode.setSpaceOfTargetNode(spaceOfTargetNode);
        String determineDBSetting = selectDBSetting();
        i_DB_RemoveNode.removeNode(p_RemoveNode, determineDBSetting);
        return 0;
    }

    public String selectDBSetting() {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/removeNode.action".equals(request.getRequestURI())) {
            returnStr = "jstreeStrutsiBatis.removeNode";
        } else {
            logger.debug(request.getRequestURI());
            throw new RuntimeException();
        }
        return returnStr;
    }

}
