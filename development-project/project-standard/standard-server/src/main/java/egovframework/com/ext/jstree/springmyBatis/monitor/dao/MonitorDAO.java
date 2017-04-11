package egovframework.com.ext.jstree.springmyBatis.monitor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.ext.jstree.springmyBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.springmyBatis.monitor.vo.T_JqGridCellData;

@Repository("MonitorDAO")
public class MonitorDAO extends EgovComAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<T_JqGridCellData> getJqGridCellData(P_JqGrid p_JstreeMonitor) {

		return (List<T_JqGridCellData>) list("monitor.getJstreeMonitor", p_JstreeMonitor);
	}
}