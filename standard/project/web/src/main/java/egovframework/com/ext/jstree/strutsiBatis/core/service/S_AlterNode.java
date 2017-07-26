package egovframework.com.ext.jstree.strutsiBatis.core.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_AlterNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;

/**
 * Modification Information
 *
 * @author 이동민
 * @version 1.0
 * @see <pre>
 *
 * Class Name 	: S_AddNode.java
 * Description 	: JSTree의 node를 추가하는 I_S_AddNode interface를 구현한 service
 * Infomation	:
 *
 * node 추가를 위하여 node정보와 해당node의 하위 정보를 가지고 와서 update
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
@Service("S_AlterNode")
public class S_AlterNode implements I_S_AlterNode {

    static Logger logger = Logger.getLogger(S_AlterNode.class);

    @Resource(name = "DB_AlterNode")
    I_DB_AlterNode i_DB_AlterNode;
    HttpServletRequest request;

    public S_AlterNode() {

    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public int alterNode(P_ComprehensiveTree p_ComprehensiveTree) {
        String determineDBSetting = selectDBSetting();
        return i_DB_AlterNode.alterNode(p_ComprehensiveTree, determineDBSetting);
    }

    public String selectDBSetting() {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/alterNode.action".equals(request.getRequestURI())) {
            returnStr = "jstreeStrutsiBatis.alterNode";
        } else {
            logger.debug(request.getRequestURI());
        }
        return returnStr;
    }

}
