package egovframework.com.jstree.springiBatis.monitor.dao;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComiBatisAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.com.ext.jstree.springiBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.springiBatis.monitor.vo.T_JqGridCellData;

@Repository("MonitorDAO")
public class MonitorDAO extends EgovComiBatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<T_JqGridCellData> getJqGridCellData(P_JqGrid p_JstreeMonitor) {

		return (List<T_JqGridCellData>) list("monitor.getJstreeMonitor", p_JstreeMonitor);
	}
}