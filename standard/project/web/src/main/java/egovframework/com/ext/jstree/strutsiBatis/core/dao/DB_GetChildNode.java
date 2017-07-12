package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: DB_GetChildNode.java
 * Description 	: JSTree의 node를 추가하는 I_DB_GetChildNode interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 *
 * 하위 node의 정보를 가져오는 클래스
 * 
 * node type 종류에는 drive  / folder /  default(file) 
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
@Repository("DB_GetChildNode")
public class DB_GetChildNode extends EgovComiBatisAbstractDAO implements I_DB_GetChildNode {

	static Logger logger = Logger.getLogger(DB_GetChildNode.class);
	
	
	/**
	 * 자식(하위)node 가져오는 메소드
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return List&lt;T_ComprehensiveTree&gt;
	 * */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_ComprehensiveTree> getChildNode(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {
		List<T_ComprehensiveTree> t_ComprehensiveTrees = new ArrayList<T_ComprehensiveTree>();
		try {
			t_ComprehensiveTrees = getSqlMapClientTemplate().getSqlMapClient()
											.queryForList(determineDBSetting, p_ComprehensiveTree);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return t_ComprehensiveTrees;
	}
	
	/**
	 * 자식(하위)node의 left와 right값을 가져오는 메소드
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return List&lt;T_ComprehensiveTree&gt;
	 * */
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_ComprehensiveTree> getChildNodeByLeftRight(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {
		List<T_ComprehensiveTree> t_ComprehensiveTrees = new ArrayList<T_ComprehensiveTree>();
		try {
			t_ComprehensiveTrees = getSqlMapClientTemplate().getSqlMapClient()
					.queryForList(determineDBSetting, p_ComprehensiveTree);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return t_ComprehensiveTrees;
	}

}
