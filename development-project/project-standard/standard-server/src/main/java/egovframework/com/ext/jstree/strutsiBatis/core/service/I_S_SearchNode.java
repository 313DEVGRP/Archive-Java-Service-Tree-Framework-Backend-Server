package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: I_S_SearchNode.java
 * Description 	: JSTree의 node를 검색하는 service의 interface
 * Infomation	: 
 *
 * node 검색
 * 
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성 
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * */
public interface I_S_SearchNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	static Logger logger = Logger.getLogger(I_S_SearchNode.class);

	public void setRequest(HttpServletRequest request);
	
	/**
	 * node 검색 
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 검색후 조회된 node들 List&lt;String&gt;
	 * */
	public List<String> searchNode(P_ComprehensiveTree p_ComprehensiveTree);
	
	/**
	 * node String 단어검색 
	 * 
	 * @param P_ComprehensiveTree(p_SearchNodeByString)
	 * @return 검색후 조회된 node들 List&lt;T_ComprehensiveTree&gt;
	 * */
	public List<T_ComprehensiveTree> searchNodeByString(
			P_ComprehensiveTree p_SearchNodeByString);
	
	/**
	 * node position 검색 
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 검색후 조회된 node의 position List&lt;String&gt;
	 * */
	public List<String> searchNodeByPosition(
			List<P_ComprehensiveTree> p_SearchNodeByPositions);

}
