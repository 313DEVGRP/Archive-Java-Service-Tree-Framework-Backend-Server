package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import javax.servlet.http.HttpServletRequest;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: I_S_AddNode.java
 * Description 	: JSTree의 node를 추가하는 service의 interface
 * Infomation	: 
 *
 * node 추가
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
public interface I_S_AddNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public void setRequest(HttpServletRequest request);
	
	/**
	 * node를 추가
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return node를 추가하고 난후의 bean 형태는 T_ComprehensiveTree
	 * */
	public T_ComprehensiveTree addNode(P_ComprehensiveTree p_ComprehensiveTree);

}
