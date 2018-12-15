package egovframework.com.ext.jstree.strutsiBatis.monitor.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.monitor.dao.I_DB_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqGridCellData;

@Service("S_GetJstreeMonitor")
public class S_GetJstreeMonitor implements I_S_GetJstreeMonitor {

	static Logger logger = Logger.getLogger(S_GetJstreeMonitor.class);
	
	@Resource(name="DB_ComprehensiveTree")
	I_DB_ComprehensiveTree i_DB_ComprehensiveTree;
	
	HttpServletRequest request;

	public S_GetJstreeMonitor() {
	}

	@Override
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public List<T_JqGridCellData> getJqGridCellData(P_JqGrid p_JstreeMonitor) {
		String determineDBSetting = selectDBSetting();

		return i_DB_ComprehensiveTree.getJstreeMonitor(p_JstreeMonitor,
				determineDBSetting);
	}

	public String selectDBSetting() {
		String returnStr = "";
		if (request
				.getRequestURI()
				.equals("/com/ext/jstree/strutsiBatis/core/monitor/list.action")) {
			returnStr = "jstreeMonitor.getJstreeMonitor";
		} else {
			logger.debug(request.getRequestURI());
		}
		return returnStr;
	}

}
