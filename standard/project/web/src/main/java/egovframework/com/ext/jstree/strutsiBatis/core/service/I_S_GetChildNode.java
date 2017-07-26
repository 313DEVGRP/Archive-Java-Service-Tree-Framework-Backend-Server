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
 * Class Name 	: I_S_GetChildNode.java
 * Description 	: JSTree의 대상 node 하위의 node정보를 가져오는 service의 interface
 * Infomation	: 
 *
 * 대상 node 하위의node정보를 가져온다.
 * 
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
public interface I_S_GetChildNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	public void setRequest(HttpServletRequest request);
	
	/**
	 * 해당 node의 하위 node들을 가져온다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 하위 node 정보들을 가져온다 List&lt;T_ComprehensiveTree&gt;
	 * */
	public List<T_ComprehensiveTree> getChildNode( P_ComprehensiveTree p_ComprehensiveTree);
	
	
	/**
	 * 하위 node들의 left와 right값들을 가져온다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 하위 node의 left와 right 정보들을 가져온다 List&lt;T_ComprehensiveTree&gt;
	 * */
	public List<T_ComprehensiveTree> getChildNodeByLeftRight( P_ComprehensiveTree p_ComprehensiveTree);

}
