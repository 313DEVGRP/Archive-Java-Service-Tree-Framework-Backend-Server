package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

public interface I_DB_SearchNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public List<T_ComprehensiveTree> searchNodeByString(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);
	
	public List<String> searchNodeByPosition(List<P_ComprehensiveTree> p_SearchNodeByPositions, String determineDBSetting);

}
