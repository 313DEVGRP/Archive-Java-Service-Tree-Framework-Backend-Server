package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


public interface I_DB_AddNode {

	public void setRequest(HttpServletRequest request);
	
	T_ComprehensiveTree addNode(P_ComprehensiveTree p_ComprehensiveTree,
								T_ComprehensiveTree nodeById, T_ComprehensiveTree nodeByRef,
								List<T_ComprehensiveTree> childNodesFromNodeByRef);
}
