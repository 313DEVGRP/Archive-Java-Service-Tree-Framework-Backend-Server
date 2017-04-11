package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
 * Class Name 	: C_GetChildNode.java
 * Description 	: JSTree의 하위 node의 정보를 가져오는 actionController 클래스
 * Infomation	: 
 * 
 * jstree의 하위 node의 정보를 가져온다.
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
public class CoreController extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware,
		SessionAware, RequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = -727128969816759415L;

	HttpServletRequest request;
	Map sessionMap;
	Map requestMap;

	@Override
	public Object getModel() {
		return null;
	}

	@Override
	public void prepare() throws Exception {
	}

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
	public String execute() {
		return Action.SUCCESS;
	}


}
