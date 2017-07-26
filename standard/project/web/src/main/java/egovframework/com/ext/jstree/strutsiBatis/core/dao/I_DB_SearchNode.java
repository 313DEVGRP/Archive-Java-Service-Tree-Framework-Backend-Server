package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.util.List;

import org.apache.log4j.Logger;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: I_DB_SearchNode.java
 * Description 	: JSTree의 node를 조회하는 dao 의 interface 
 * Infomation	: 
 *
 * node를 조회한다.
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
public interface I_DB_SearchNode extends
		I_GenericDao<T_ComprehensiveTree, P_ComprehensiveTree> {

	/**
	 * String 단어에 해당하는 node의 정보를 가져온다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return 조회결과에 따른 node들의 정보 List&lt;T_ComprehensiveTree&gt
	 * */
	public List<T_ComprehensiveTree> searchNodeByString( P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting);
	
	/**
	 * node의 psition값의 정보를 가져온다.
	 * 
	 * @param List&lt;P_ComprehensiveTree&gt(p_SearchNodeByPositions)
	 * @param String(determineDBSetting)
	 * @return 조회결과에 따른 node position값들의 정보 List&lt;String&gt
	 * */
	public List<String> searchNodeByPosition( List<P_ComprehensiveTree> p_SearchNodeByPositions, String determineDBSetting);

}
