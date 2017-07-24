package egovframework.com.ext.jstree.strutsiBatis.monitor.dao;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqGridCellData;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository("DB_ComprehensiveTree")
public class DB_ComprehensiveTree extends EgovComiBatisAbstractDAO implements
		I_DB_ComprehensiveTree {

	static Logger logger = Logger.getLogger(DB_ComprehensiveTree.class);

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<T_JqGridCellData> getJstreeMonitor(P_JqGrid p_JqGrid,
			String determineDBSetting) {

		List<T_JqGridCellData> t_JqGridCellDatas = new ArrayList<T_JqGridCellData>();

		try {
			t_JqGridCellDatas = getSqlMapClientTemplate().getSqlMapClient().queryForList("strutsMonitor.getJstreeMonitor", p_JqGrid);
		} catch (SQLException e) {
			logger.error(e);
		}

		return t_JqGridCellDatas;
	}
}
