package egovframework.com.jstree.springiBatis.monitor.vo;

import java.util.ArrayList;
import java.util.List;

public class T_JqGridCellData {
	private int c_id;
	private int c_parentid;
	private int c_position;
	private int c_left;
	private int c_right;
	private int c_level;
	private String c_title;
	private String c_type;

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getC_parentid() {
		return c_parentid;
	}

	public void setC_parentid(int c_parentid) {
		this.c_parentid = c_parentid;
	}

	public int getC_position() {
		return c_position;
	}

	public void setC_position(int c_position) {
		this.c_position = c_position;
	}

	public int getC_left() {
		return c_left;
	}

	public void setC_left(int c_left) {
		this.c_left = c_left;
	}

	public int getC_right() {
		return c_right;
	}

	public void setC_right(int c_right) {
		this.c_right = c_right;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public List<String> getCellData() {
		List<String> list = new ArrayList<String>();
		list.add(Integer.toString(c_id));
		list.add(Integer.toString(c_parentid));
		list.add(Integer.toString(c_position));
		list.add(Integer.toString(c_left));
		list.add(Integer.toString(c_right));
		list.add(Integer.toString(c_level));
		list.add(c_title);
		list.add(c_type);
		return list;
	}

}
