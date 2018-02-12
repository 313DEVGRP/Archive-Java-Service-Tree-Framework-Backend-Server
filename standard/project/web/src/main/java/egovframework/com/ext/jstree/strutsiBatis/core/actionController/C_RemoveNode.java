package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import egovframework.com.ext.jstree.strutsiBatis.core.service.I_S_RemoveNode;
import egovframework.com.ext.jstree.strutsiBatis.core.service.Util_SwapNode;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@SuppressWarnings("rawtypes")
public class C_RemoveNode extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware, SessionAware, RequestAware {

    private static final long serialVersionUID = 7795427982040661127L;

    private static final Logger logger = Logger.getLogger(C_RemoveNode.class);

    T_ComprehensiveTree t_ComprehensiveTree;

    @Resource(name = "S_RemoveNode")
    I_S_RemoveNode i_S_RemoveNode;

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
        t_ComprehensiveTree = new T_ComprehensiveTree();
    }

    @Override
    public String execute() {

        i_S_RemoveNode.setRequest(request);
        t_ComprehensiveTree.setStatus(i_S_RemoveNode.executeRemoveNode(Util_SwapNode.swapTtoP(t_ComprehensiveTree)));
        return Action.SUCCESS;
    }

    @Override
    public void validate() {

        if (request.getParameter("c_id") == null) {
            throw new RuntimeException();
        } else {
            if ("0".equals(request.getParameter("c_id"))|| "1".equals(request.getParameter("c_id"))) {
                throw new RuntimeException();
            }
        }

    }
}
