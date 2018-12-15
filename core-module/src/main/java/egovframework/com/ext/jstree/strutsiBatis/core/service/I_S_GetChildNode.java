package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface I_S_GetChildNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public void setRequest(HttpServletRequest request);
	
	public List<T_ComprehensiveTree> getChildNode( P_ComprehensiveTree p_ComprehensiveTree);

	public List<T_ComprehensiveTree> getChildNodeByLeftRight( P_ComprehensiveTree p_ComprehensiveTree);

}
