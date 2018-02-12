package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface I_S_SearchNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public void setRequest(HttpServletRequest request);
	
	public List<String> searchNode(P_ComprehensiveTree p_ComprehensiveTree);
	
	public List<T_ComprehensiveTree> searchNodeByString(P_ComprehensiveTree p_SearchNodeByString);
	
	public List<String> searchNodeByPosition(List<P_ComprehensiveTree> p_SearchNodeByPositions);

}
