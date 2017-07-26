package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_AlterNodeType;
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
 * Class Name 	: C_AlterNodeType.java
 * Description 	: JSTree의 node type을 수정하는 actionController 클래스
 * Infomation	:
 *
 * node type 수정
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
public class C_AlterNodeType extends ActionSupport implements Preparable,
        ModelDriven, ServletRequestAware, SessionAware, RequestAware {

    private static final long serialVersionUID = 432763084094442313L;

    private static final Logger logger = Logger.getLogger(C_AlterNodeType.class);

    P_ComprehensiveTree p_ComprehensiveTree;
    T_ComprehensiveTree t_ComprehensiveTree;

    @Resource(name = "S_AlterNodeType")
    I_S_AlterNodeType i_S_AlterNodeType;

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
        i_S_AlterNodeType.setRequest(request);
        i_S_AlterNodeType.alterNodeType(Util_SwapNode
                .swapTtoP(t_ComprehensiveTree));

        return Action.SUCCESS;
    }

    @Override
    public void validate() {

        if (request.getParameter("c_id") == null || request.getParameter("c_type") == null) {
            throw new RuntimeException();
        } else {
            if ("0".equals(request.getParameter("c_id"))) {
                throw new RuntimeException("alterNodeType c_id value is 0");
            }
            if ("1".equals(request.getParameter("c_id"))) {
                throw new RuntimeException("alterNodeType c_id value is 1");
            }

            if ("default".equals(request.getParameter("c_type")) || "folder".equals(request.getParameter("c_type"))) {
                logger.info("c_type is default or folder");
            } else {
                if ("drive".equals(request.getParameter("c_type"))) {
                    throw new RuntimeException("alterNodeType c_position value is drive");
                } else {
                    throw new RuntimeException("alterNodeType c_position value is another");
                }
            }
        }

    }
}
