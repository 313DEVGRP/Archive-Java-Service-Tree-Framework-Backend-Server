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
 * Class Name 	: I_DB_RemoveNode.java
 * Description 	: JSTree의 node를 제거하는 dao 의 interface 
 * Infomation	: 
 *
 * node를 제거한다.
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
public interface I_DB_RemoveNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	static Logger logger = Logger.getLogger(I_DB_RemoveNode.class);
	
	/**
	 * node를 제거한다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return node제거 처리 결과에 따른 결과값(int)
	 * */
	public int removeNode(P_ComprehensiveTree p_RemoveNode,
			String determineDBSetting);

}
