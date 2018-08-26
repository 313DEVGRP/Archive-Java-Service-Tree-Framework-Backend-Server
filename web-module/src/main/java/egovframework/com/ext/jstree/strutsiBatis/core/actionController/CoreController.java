package egovframework.com.ext.jstree.strutsiBatis.core.actionController;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@SuppressWarnings("rawtypes")
public class CoreController extends ActionSupport implements Preparable, ModelDriven, ServletRequestAware, SessionAware, RequestAware {
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
