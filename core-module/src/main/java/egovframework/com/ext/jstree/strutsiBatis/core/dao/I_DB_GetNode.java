package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

public interface I_DB_GetNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);
	
	public T_ComprehensiveTree getNodeByRef(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);

}
