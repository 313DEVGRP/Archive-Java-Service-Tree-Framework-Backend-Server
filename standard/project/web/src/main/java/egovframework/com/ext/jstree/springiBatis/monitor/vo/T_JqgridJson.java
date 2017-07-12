package egovframework.com.ext.jstree.springiBatis.monitor.vo;

import java.util.List;

public class T_JqgridJson {

	private String page;
	private String total;
	private String records;
	private List<T_JqGridRowData> rows;

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getRecords() {
		return records;
	}

	public void setRecords(String records) {
		this.records = records;
	}

	public List<T_JqGridRowData> getRows() {
		return rows;
	}

	public void setRows(List<T_JqGridRowData> rows) {
		this.rows = rows;
	}

	public void setRows(int rows) {
		// this.rows = rows;
	}

	public void setPage(int page) {
		// this.rows = rows;
	}

}
