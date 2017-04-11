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
 * Description 	: JSTree의 node의 정보를 가져오는 service의 interface
 * Infomation	: 
 *
 * node 조회
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
public interface I_S_GetNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {
	
    /**
     * node의 정보를 가져온다.
     * 
     * @param P_ComprehensiveTree(p_ComprehensiveTree)
     * @param String(flag)
     * @return node를 추가한 결과값(T_ComprehensiveTree)
     * */
	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree,
			String flag);
	
	/**
     * node가 이동할 곳의 정보를 가져온다.
     * 
     * @param P_ComprehensiveTree(p_ComprehensiveTree)
     * @param String(flag)
     * @return node를 추가한 결과값(T_ComprehensiveTree)
     * */
	public T_ComprehensiveTree getNodeByRef(
			P_ComprehensiveTree p_ComprehensiveTree, String flag);

	public void setRequest(HttpServletRequest request);
}
