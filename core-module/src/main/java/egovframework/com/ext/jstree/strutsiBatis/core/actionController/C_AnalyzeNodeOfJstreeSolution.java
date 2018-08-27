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

@SuppressWarnings("rawtypes")
public class C_AnalyzeNodeOfJstreeSolution extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware, SessionAware, RequestAware {

	private static final long serialVersionUID = -3617970050236026092L;

	private static final Logger logger = Logger.getLogger(C_AnalyzeNodeOfJstreeSolution.class);

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
