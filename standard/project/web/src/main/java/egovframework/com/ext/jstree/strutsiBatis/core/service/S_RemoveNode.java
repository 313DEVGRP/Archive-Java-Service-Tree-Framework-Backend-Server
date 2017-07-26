package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_RemoveNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Modification Information
 *
 * @author 이동민
 * @version 1.0
 * @see <pre>
 *
 * Class Name 	: S_RemoveNode.java
 * Description 	: JSTree의 node정보를 가져오는  I_S_RemoveNode interface를 구현한 service
 * Infomation	:
 *
 * node들을 제거한다.
 *
 *  << 개정이력(Modification Information) >>
 *
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성
 *
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * @since 2014.07.25
 */
@Service("S_RemoveNode")
public class S_RemoveNode implements I_S_RemoveNode {

    HttpServletRequest request;

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

    /**
     * node를 제거한다.
     *
     * @param P_ComprehensiveTree(p_RemoveNode)
     * @return node 제거 처리에 대한 결과값 (int)
     */
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
