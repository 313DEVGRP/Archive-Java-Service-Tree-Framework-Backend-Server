package egovframework.com.ext.jstree.strutsiBatis.core.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository("DB_GetChildNode")
public class DB_GetChildNode extends EgovComiBatisAbstractDAO implements I_DB_GetChildNode {

	private static final Logger logger = Logger.getLogger(DB_GetChildNode.class);
	
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_ComprehensiveTree> getChildNode(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {
		List<T_ComprehensiveTree> t_ComprehensiveTrees = new ArrayList<T_ComprehensiveTree>();
		try {
			t_ComprehensiveTrees = getSqlMapClientTemplate().getSqlMapClient()
											.queryForList(determineDBSetting, p_ComprehensiveTree);
		} catch (SQLException e) {
			logger.error(e);
		} finally {
			logger.info("getChildNode Complete");
		}
		return t_ComprehensiveTrees;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_ComprehensiveTree> getChildNodeByLeftRight(
			P_ComprehensiveTree p_ComprehensiveTree, String determineDBSetting) {
		List<T_ComprehensiveTree> t_ComprehensiveTrees = new ArrayList<T_ComprehensiveTree>();
		try {
			t_ComprehensiveTrees = getSqlMapClientTemplate().getSqlMapClient()
					.queryForList(determineDBSetting, p_ComprehensiveTree);
		} catch (SQLException e) {
			logger.error(e);
		} finally {
			logger.info("getChildNodeByLeftRight complete");
		}
		return t_ComprehensiveTrees;
	}

}
