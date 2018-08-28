package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

public interface I_DB_RemoveNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public int removeNode(P_ComprehensiveTree p_RemoveNode, String determineDBSetting);

}
