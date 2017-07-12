package egovframework.com.ext.jstree.strutsiBatis.core.interceptor;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: CachingHeadersInterceptor.java
 * 	Description : browser에서 보안을 위하여 caching을 남기지 않기 위한 목적의 클래스 
 * 	Infomation	: caching을 하게되면 성능저하가 발생할수있으니 로그인 페이지등 제한적으로 사용이 요구된다.
 * 
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * 
 * */
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