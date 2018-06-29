package egovframework.com.ext.jstree.strutsiBatis.core.interceptor;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CachingHeadersInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 2823210658805669130L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		final ActionContext context = invocation.getInvocationContext();

		HttpServletResponse response = (HttpServletResponse) context
				.get(StrutsStatics.HTTP_RESPONSE);
		if (response != null) {
			response.setHeader("Cache-control", "no-cache, no-store");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "-1");
		}

		return invocation.invoke();
	}

}