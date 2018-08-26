package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

public interface I_DB_GetChildNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public List<T_ComprehensiveTree> getChildNode( P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);
	public List<T_ComprehensiveTree> getChildNodeByLeftRight( P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);

}
