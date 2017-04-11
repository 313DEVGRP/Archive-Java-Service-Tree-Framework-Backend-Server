package egovframework.com.ext.jstree.strutsiBatis.core.service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

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
 * Class Name 	: I_S_AlterNode.java
 * Description 	: JSTree의 node 수정하는 service의 interface
 * Infomation	: 
 *
 * node 정보 수정
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
public interface I_S_AlterNodeType extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	static Logger logger = Logger.getLogger(I_S_AlterNode.class);

	public void setRequest(HttpServletRequest request);
	/**
	 * node type 수정
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return node type을 수정한 데이터의 결과값(int)
	 * @see <pre>
	 * 
	 * node의 type의 종류에는 drive / folder / default(file) 3종류가 있다.
	 * </pre>
	 * 
	 * */
	public int alterNodeType(P_ComprehensiveTree p_ComprehensiveTree);

}
