package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

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
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_AlterNode;
import egovframework.com.ext.jstree.strutsiBatis.core.service.Util_SwapNode;
import egovframework.com.ext.jstree.strutsiBatis.core.service.Util_TitleChecker;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.28
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: C_AlterNode.java
 * Description 	: JSTree의 node를 수정하는 actionController 클래스
 * Infomation	: 
 *
 * node 수정
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
public class C_AlterNode extends ActionSupport implements Preparable,
		ModelDriven, ServletRequestAware, SessionAware, RequestAware {

	private static final long serialVersionUID = -4744232049195539543L;

	static Logger logger = Logger.getLogger(C_AlterNode.class);

	P_ComprehensiveTree p_ComprehensiveTree;
	T_ComprehensiveTree t_ComprehensiveTree;
	
	@Resource(name="S_AlterNode")
	I_S_AlterNode i_S_AlterNode;

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
		return t_ComprehensiveTree;
	}

	@Override
	public void prepare() throws Exception {
		p_ComprehensiveTree = new P_ComprehensiveTree();
		t_ComprehensiveTree = new T_ComprehensiveTree();
	}

	@Override
	public String execute() {

		t_ComprehensiveTree.setC_title(Util_TitleChecker
				.StringReplace(t_ComprehensiveTree.getC_title()));
		i_S_AlterNode.setRequest(request);
		t_ComprehensiveTree.setStatus(i_S_AlterNode.alterNode(Util_SwapNode
				.swapTtoP(t_ComprehensiveTree)));

		return Action.SUCCESS;
	}

	@Override
	public void validate() {

		if (request.getParameter("c_id") == null
				|| request.getParameter("c_title") == null
				|| request.getParameter("c_type") == null) {
			throw new RuntimeException("alterNode parameter null");
		} else {
			if (request.getParameter("c_id").equals("0")) {
				throw new RuntimeException("alterNode ref value is 0");
			}
			if (request.getParameter("c_id").equals("1")) {
				throw new RuntimeException("alterNode ref value is 1");
			}

			if (request.getParameter("c_type").equals("default")
					|| request.getParameter("c_type").equals("folder")) {
			} else {
				if (request.getParameter("c_type").equals("drive")) {
					throw new RuntimeException(
							"alterNode c_position value is drive");
				} else {
					throw new RuntimeException(
							"alterNode c_position value is another");
				}
			}
		}

	}
}
