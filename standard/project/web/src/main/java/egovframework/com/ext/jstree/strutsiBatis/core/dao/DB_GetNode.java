package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

import java.sql.SQLException;

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
 * Class Name 	: DB_GetNode.java
 * Description 	: JSTree의 node를 추가하는 I_DB_GetNode interface를 구현하고 DB연동을 지원하는 EgovComAbstractDAO를 확장한 dao 클래스
 * Infomation	: 
 *
 * node의 정보를 가져오는 클래스
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
@Repository("DB_GetNode")
public class DB_GetNode extends EgovComiBatisAbstractDAO implements I_DB_GetNode {

	static Logger logger = Logger.getLogger(DB_GetNode.class);
	
	
	/**
	 * node정보 가져오기
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return T_ComprehensiveTree
	 * */
	@SuppressWarnings("deprecation")
	@Override
	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree,
			String determineDBSetting) {

		T_ComprehensiveTree t_ComprehensiveTree = new T_ComprehensiveTree();

		try {
			t_ComprehensiveTree = (T_ComprehensiveTree) getSqlMapClientTemplate().getSqlMapClient().queryForObject(determineDBSetting,
							p_ComprehensiveTree);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return t_ComprehensiveTree;
	}
	
	/**
	 * taget node정보 가져오기
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param String(determineDBSetting)
	 * @return T_ComprehensiveTree
	 * */
	@SuppressWarnings("deprecation")
	@Override
	public T_ComprehensiveTree getNodeByRef(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {

		T_ComprehensiveTree t_ComprehensiveTree = new T_ComprehensiveTree();

		try {
			t_ComprehensiveTree = (T_ComprehensiveTree) getSqlMapClientTemplate().getSqlMapClient().queryForObject(determineDBSetting,
							p_ComprehensiveTree);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return t_ComprehensiveTree;
	}
}
