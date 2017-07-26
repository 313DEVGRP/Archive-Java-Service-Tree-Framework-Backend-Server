package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_MoveNode;
import egovframework.com.ext.jstree.strutsiBatis.core.service.Util_SwapNode;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;


/**
 * Modification Information
 *
 * @author 이동민
 * @version 1.0
 * @see <pre>
 *
 * Class Name 	: C_MoveNode.java
 * Description 	: JSTree의 node의 이동을 하는  actionController 클래스
 * Infomation	:
 *
 * jstree의 node의 이동
 *
 *  << 개정이력(Modification Information) >>
 *
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.28    Dongmin.Lee      최초 생성
 *
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * @since 2014.07.28
 */
@SuppressWarnings("rawtypes")
public class C_MoveNode extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware, SessionAware, RequestAware {

    private static final long serialVersionUID = 4164420298258634557L;

    static Logger logger = Logger.getLogger(C_MoveNode.class);

    P_ComprehensiveTree p_ComprehensiveTree;
    T_ComprehensiveTree t_ComprehensiveTree;

    @Resource(name = "S_MoveNode")
    I_S_MoveNode i_S_MoveNode;

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
        i_S_MoveNode.setRequest(request);
        Util_SwapNode.copyTtoT(i_S_MoveNode.moveNode(Util_SwapNode.swapTtoP(t_ComprehensiveTree)), t_ComprehensiveTree);
        return Action.SUCCESS;
    }

    @Override
    public void validate() {

        if (request.getParameter("c_id") == null || request.getParameter("c_position") == null || request.getParameter("copy") == null || request.getParameter("multiCounter") == null || request.getParameter("ref") == null) {
            throw new RuntimeException("invalid parameters Null");
        } else {
            if ("0".equals(request.getParameter("ref"))) {
                throw new RuntimeException("moveNode ref value is 0");
            }

            if ("0".equals(request.getParameter("c_id")) || "1".equals(request.getParameter("c_id"))) {
                throw new RuntimeException("invalid parameters c_id is 0 or 1");
            }

            if (Integer.parseInt(request.getParameter("c_position")) < 0) {
                throw new RuntimeException("addNode c_postion less 0");
            }

            if (Integer.parseInt(request.getParameter("copy")) < 0) {
                throw new RuntimeException("addNode copy less 0");
            } else {
                if (Integer.parseInt(request.getParameter("copy")) > 1) {
                    throw new RuntimeException("addNode copy lager 1");
                }
            }

            if (Integer.parseInt(request.getParameter("multiCounter")) < 0) {
                throw new RuntimeException("addNode multiCounter less 0");
            }
        }

    }

}