package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface I_DB_MoveNode {

	public void setRequest(HttpServletRequest request);
	
	T_ComprehensiveTree moveNode(P_ComprehensiveTree p_ComprehensiveTree,
								 T_ComprehensiveTree nodeById,
								 List<T_ComprehensiveTree> childNodesFromNodeById,
								 T_ComprehensiveTree nodeByRef,
								 List<T_ComprehensiveTree> childNodesFromNodeByRef);

}
