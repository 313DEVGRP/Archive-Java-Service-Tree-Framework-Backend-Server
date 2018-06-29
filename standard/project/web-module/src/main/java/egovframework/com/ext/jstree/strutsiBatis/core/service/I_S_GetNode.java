package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import javax.servlet.http.HttpServletRequest;

public interface I_S_GetNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {
	
	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree,
									   String flag);
	
	public T_ComprehensiveTree getNodeByRef(
			P_ComprehensiveTree p_ComprehensiveTree, String flag);

	public void setRequest(HttpServletRequest request);
}
