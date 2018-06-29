package egovframework.com.ext.jstree.strutsiBatis.monitor.dao;

import java.util.List;

import org.apache.log4j.Logger;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_GenericDao;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqGridCellData;

public interface I_DB_ComprehensiveTree extends
		I_GenericDao<T_JqGridCellData, P_JqGrid> {

	static Logger logger = Logger.getLogger(I_DB_ComprehensiveTree.class);

	List<T_JqGridCellData> getJstreeMonitor(P_JqGrid p_JqGrid,
											String determineDBSetting);

}
