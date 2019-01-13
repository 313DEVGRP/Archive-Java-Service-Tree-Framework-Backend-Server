package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_AlterNodeType;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service("S_AlterNodeType")
public class S_AlterNodeType implements I_S_AlterNodeType {

    static Logger logger = Logger.getLogger(S_AlterNodeType.class);

    HttpServletRequest request;

    @Resource(name = "S_GetChildNode")
    I_S_GetChildNode i_S_GetChildNode;

    @Resource(name = "S_GetNode")
    I_S_GetNode i_S_GetNode;

    @Resource(name = "DB_AlterNodeType")
    I_DB_AlterNodeType i_DB_AlterNodeType;

    public S_AlterNodeType() {
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;

    }

    @Override
    public int alterNodeType(P_ComprehensiveTree p_ComprehensiveTree) {

        i_S_GetChildNode.setRequest(request);
        List<T_ComprehensiveTree> childNodesFromNodeById = i_S_GetChildNode.getChildNode(p_ComprehensiveTree);

        i_S_GetNode.setRequest(request);
        T_ComprehensiveTree nodeById = i_S_GetNode.getNode(p_ComprehensiveTree, "getNode");

        int returnStatus = 0;
        if (p_ComprehensiveTree.getC_type().equals("default")) {

            if (childNodesFromNodeById.size() > 0) {
                throw new RuntimeException("하위에 노드가 있는데 디폴트로 바꾸려고 함");
            } else {
                p_ComprehensiveTree.setC_type("default");
                String determineDBSetting = selectDBSetting();
                int temp = i_DB_AlterNodeType.alterNodeType(p_ComprehensiveTree, determineDBSetting);

                if (temp == 1) {
                    returnStatus = 1;
                } else {
                    throw new RuntimeException("여러개의 노드가 업데이트 되었음");
                }
            }
        } else {
            if (nodeById.getC_type().equals("folder")) {
                returnStatus = 1;
            } else {
                String determineDBSetting = selectDBSetting();
                returnStatus = i_DB_AlterNodeType.alterNodeType(p_ComprehensiveTree, determineDBSetting);
            }

        }
        return returnStatus;
    }

    public String selectDBSetting() {
        String returnStr = "";
        if ("/com/ext/jstree/strutsiBatis/core/alterNodeType.action".equals(request.getRequestURI())) {
            returnStr = "jstreeStrutsiBatis.alterNodeType";
        } else {
            logger.debug(request.getRequestURI());
        }
        return returnStr;
    }

}
