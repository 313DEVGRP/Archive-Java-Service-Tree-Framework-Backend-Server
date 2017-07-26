package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_GetChildNode;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
public class C_GetChildNode extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware, SessionAware, RequestAware {

	private static final long serialVersionUID = 1135059314438464570L;

	static Logger logger = Logger.getLogger(C_GetChildNode.class);

	P_ComprehensiveTree p_ComprehensiveTree;
	List<T_ComprehensiveTree> t_GetChildNodes;

	@Resource(name="S_GetChildNode")
	I_S_GetChildNode i_S_GetChildNode;

	HttpServletRequest request;
	Map sessionMap;
	Map requestMap;

	@Override
	public Object getModel() {
		return t_GetChildNodes;
	}

	@Override
	public void prepare() throws Exception {
		p_ComprehensiveTree = new P_ComprehensiveTree();
		t_GetChildNodes = new ArrayList<T_ComprehensiveTree>();
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
		p_ComprehensiveTree.setC_id(Integer.parseInt(request.getParameter("c_id")));
		i_S_GetChildNode.setRequest(request);
		t_GetChildNodes.addAll(i_S_GetChildNode.getChildNode(p_ComprehensiveTree));

		return Action.SUCCESS;
	}

	@Override
	public void validate() {

		if (request.getParameter("c_id") == null) {
			throw new RuntimeException();
		} else {
			if ("0".equals(request.getParameter("c_id"))) {
				throw new RuntimeException();
			}
		}
	}
}
