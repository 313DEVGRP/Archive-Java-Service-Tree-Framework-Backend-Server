package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;

@Repository("DB_GetNode")
public class DB_GetNode extends EgovComiBatisAbstractDAO implements I_DB_GetNode {

	private static final Logger logger = Logger.getLogger(DB_GetNode.class);
	
	
	@SuppressWarnings("deprecation")
	@Override
	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree,
			String determineDBSetting) {

		T_ComprehensiveTree t_ComprehensiveTree = new T_ComprehensiveTree();

		try {
			t_ComprehensiveTree = (T_ComprehensiveTree) getSqlMapClientTemplate().getSqlMapClient().queryForObject(determineDBSetting,
							p_ComprehensiveTree);
		} catch (SQLException e) {
			logger.error(e);
		} finally {

		}
		return t_ComprehensiveTree;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public T_ComprehensiveTree getNodeByRef(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {

		T_ComprehensiveTree t_ComprehensiveTree = new T_ComprehensiveTree();

		try {
			t_ComprehensiveTree = (T_ComprehensiveTree) getSqlMapClientTemplate().getSqlMapClient().queryForObject(determineDBSetting,
							p_ComprehensiveTree);
		} catch (SQLException e) {
			logger.error(e);
		} finally {

		}
		return t_ComprehensiveTree;
	}
}
