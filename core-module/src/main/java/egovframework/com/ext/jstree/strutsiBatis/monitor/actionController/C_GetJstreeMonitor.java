package egovframework.com.ext.jstree.strutsiBatis.monitor.actionController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import egovframework.com.ext.jstree.strutsiBatis.monitor.service.I_S_GetJstreeMonitor;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.P_JqGrid;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqGridCellData;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqGridRowData;
import egovframework.com.ext.jstree.strutsiBatis.monitor.vo.T_JqgridJson;

@SuppressWarnings("rawtypes")
public class C_GetJstreeMonitor extends ActionSupport implements Preparable,
		ModelDriven, ServletRequestAware, SessionAware, RequestAware {

	private static final long serialVersionUID = 6142666406611086763L;

	static Logger logger = Logger.getLogger(C_GetJstreeMonitor.class);

	T_JqgridJson t_JqgridJson;
	P_JqGrid p_JqGrid;
	List<T_JqGridCellData> t_JqGridCellDatas;

	@Resource(name="S_GetJstreeMonitor")
	I_S_GetJstreeMonitor i_S_GetJstreeMonitor;

	HttpServletRequest request;
	Map sessionMap;
	Map requestMap;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	@Override
	public void setSession(Map session) {
		this.sessionMap = session;
	}

	@Override
	public void setRequest(Map requestMap) {
		this.requestMap = requestMap;
	}

	@Override
	public Object getModel() {
		return t_JqgridJson;
	}

	@Override
	public void prepare() throws Exception {
		t_JqgridJson = new T_JqgridJson();
		p_JqGrid = new P_JqGrid();
		t_JqGridCellDatas = new ArrayList<T_JqGridCellData>();
	}

	@Override
	public String execute() {

		t_JqgridJson.setPage("1");
		t_JqgridJson.setRecords("1");
		t_JqgridJson.setTotal("1");

		List<T_JqGridRowData> rows = new ArrayList<T_JqGridRowData>();

		i_S_GetJstreeMonitor.setRequest(request);

		t_JqGridCellDatas = i_S_GetJstreeMonitor.getJqGridCellData(p_JqGrid);
		for (T_JqGridCellData t_JqGridCellData : t_JqGridCellDatas) {
			T_JqGridRowData rowData = new T_JqGridRowData();

			rowData.setId(Integer.toString(t_JqGridCellData.getC_id()));
			rowData.setCell(t_JqGridCellData.getCellData());

			rows.add(rowData);
		}

		t_JqgridJson.setRows(rows);

		return Action.SUCCESS;

	}

	@Override
	public void validate() {

	}

}