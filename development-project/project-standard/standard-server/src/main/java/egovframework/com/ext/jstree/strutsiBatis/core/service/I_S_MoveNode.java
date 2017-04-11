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
 * Class Name 	: I_S_MoveNode.java
 * Description 	: JSTree의 node를 이동하는 service의 interface
 * Infomation	: 
 *
 * node 이동
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
public interface I_S_MoveNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public void setRequest(HttpServletRequest request);
	
	/**
	 * node의 이동
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 이동후 결과 T_ComprehensiveTree
	 * */
	public T_ComprehensiveTree moveNode(P_ComprehensiveTree p_ComprehensiveTree);
}
