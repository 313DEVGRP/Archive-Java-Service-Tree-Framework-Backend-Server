package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.28
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: C_AnalyzeNodeOfJstreeSolution.java
 * Description 	: JSTree의 이벤트의 정보를 보여주는  actionController 클래스
 * Infomation	: 
 *
 * jstree의 이벤트를 사용자에게 보여준다.
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
public class C_AnalyzeNodeOfJstreeSolution extends ActionSupport implements
		Preparable, ModelDriven, ServletRequestAware, SessionAware,
		RequestAware {

	private static final long serialVersionUID = -3617970050236026092L;

	static Logger logger = Logger
			.getLogger(C_AnalyzeNodeOfJstreeSolution.class);

	StringBuilder alayzeResult;

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
		return alayzeResult.toString();
	}

	@Override
	public void prepare() throws Exception {
		alayzeResult = new StringBuilder();
	}

	@Override
	public String execute() {

		return Action.SUCCESS;
	}

	@Override
	public void validate() {

	}

}
