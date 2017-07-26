package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import org.apache.log4j.Logger;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: I_DB_AlterNodeType.java
 * Description 	: JSTree의 node를 수정하는 dao 의 interface 
 * Infomation	: 
 *
 * node type 수정
 * 
 * node type에는 drive / folder / default(file) 이있다.
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
public interface I_DB_AlterNodeType extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	/**
	 * node type 수정
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return node type 수정 처리 결과에 따른 결과값 (int)
	 * */
	public int alterNodeType(P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);

}
