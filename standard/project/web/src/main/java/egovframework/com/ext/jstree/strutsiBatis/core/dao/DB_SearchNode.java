package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: DB_SearchNode.java
 * Description 	: JSTree의 node를 조회하는 I_DB_SearchNode interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 *
 * node의 조회
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
@Repository("DB_SearchNode")
public class DB_SearchNode extends EgovComiBatisAbstractDAO implements I_DB_SearchNode {

	static Logger logger = Logger.getLogger(DB_GetChildNode.class);
	
	
	/**
	 * String을 통한 node 검색
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return 조회결과에 따른 node들의 정보 List&lt;T_ComprehensiveTree&gt
	 * */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_ComprehensiveTree> searchNodeByString(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {

		List<T_ComprehensiveTree> t_ComprehensiveTrees = new ArrayList<T_ComprehensiveTree>();

		try {
			t_ComprehensiveTrees = getSqlMapClientTemplate().getSqlMapClient()
					.queryForList(determineDBSetting, p_ComprehensiveTree);
		} catch (SQLException e) {
			logger.error(e);
		} finally {

		}
		return t_ComprehensiveTrees;
	}
	
	/**
	 * position 검색
	 * 
	 * @param List&lt;P_ComprehensiveTree&gt(p_SearchNodeByPositions)
	 * @param String(determineDBSetting)
	 * @return 조회결과에 따른 node position값들의 정보 List&lt;String&gt
	 * */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<String> searchNodeByPosition(
			List<P_ComprehensiveTree> p_SearchNodeByPositions,
			String determineDBSetting) {
		List<String> returnList = new ArrayList<String>();

		try {
			List<String> dbList = getSqlMapClientTemplate().getSqlMapClient()
					.queryForList(determineDBSetting, p_SearchNodeByPositions);
			for (String rowData : dbList) {
				rowData = "#node_" + rowData;
				returnList.add(rowData);
			}
		} catch (SQLException e) {
			logger.error(e);
		} finally {

		}
		return returnList;
	}

}
