package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

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

import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_SearchNode;
import egovframework.com.ext.jstree.strutsiBatis.core.service.Util_TitleChecker;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.28
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: C_SearchNode.java
 * Description 	: JSTree의 node의 정보를 조회하는  actionController 클래스
 * Infomation	: 
 *
 * jstree의 정보를 조회한다.
 * 
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.28    Dongmin.Lee      최초 생성 
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * */
@SuppressWarnings("rawtypes")
public class C_SearchNode extends ActionSupport implements Preparable,
		ModelDriven, ServletRequestAware, SessionAware, RequestAware {

	private static final long serialVersionUID = 4187246952455486758L;
	static Logger logger = Logger.getLogger(C_SearchNode.class);

	List<String> searchNodeResults;
	P_ComprehensiveTree p_ComprehensiveTree;

	@Resource(name="S_SearchNode")
	I_S_SearchNode i_S_SearchNode;

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
		return searchNodeResults;
	}

	@Override
	public void prepare() throws Exception {
		p_ComprehensiveTree = new P_ComprehensiveTree();
		searchNodeResults = new ArrayList<String>();

		//i_S_SearchNode = new S_SearchNode();
	}

	@Override
	public String execute() {
		i_S_SearchNode.setRequest(request);
		p_ComprehensiveTree.setSearchStr(Util_TitleChecker
				.StringReplace(request.getParameter("searchString")));

		searchNodeResults
				.addAll(i_S_SearchNode.searchNode(p_ComprehensiveTree));
		return Action.SUCCESS;
	}

	@Override
	public void validate() {

		if (request.getParameter("searchString") == null) {
			throw new RuntimeException();
		}

	}
}