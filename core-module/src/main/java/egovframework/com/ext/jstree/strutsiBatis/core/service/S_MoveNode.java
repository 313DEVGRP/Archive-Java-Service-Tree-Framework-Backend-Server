package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_MoveNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

@Service("S_MoveNode")
public class S_MoveNode implements I_S_MoveNode {

    static Logger logger = Logger.getLogger(S_MoveNode.class);

    HttpServletRequest request;

    @Resource(name = "DB_MoveNode")
    I_DB_MoveNode i_DB_MoveNode;

    @Resource(name = "S_GetNode")
    I_S_GetNode i_S_GetNode;

    @Resource(name = "S_GetChildNode")
    I_S_GetChildNode i_S_GetChildNode;

    public S_MoveNode() {
    }

    @Override
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public T_ComprehensiveTree moveNode(P_ComprehensiveTree p_ComprehensiveTree) {

        i_S_GetNode.setRequest(request);
        T_ComprehensiveTree nodeById = i_S_GetNode.getNode(p_ComprehensiveTree, "getNode");
        i_S_GetChildNode.setRequest(request);
        List<T_ComprehensiveTree> childNodesFromNodeById = i_S_GetChildNode.getChildNodeByLeftRight(Util_SwapNode.swapTtoP(nodeById));

        T_ComprehensiveTree nodeByRef = i_S_GetNode.getNodeByRef(p_ComprehensiveTree, "getNodeByRef");
        List<T_ComprehensiveTree> childNodesFromNodeByRef = i_S_GetChildNode.getChildNode(Util_SwapNode.swapTtoP(nodeByRef));

        i_DB_MoveNode.setRequest(request);
        return i_DB_MoveNode.moveNode(p_ComprehensiveTree, nodeById, childNodesFromNodeById, nodeByRef, childNodesFromNodeByRef);

    }

}
