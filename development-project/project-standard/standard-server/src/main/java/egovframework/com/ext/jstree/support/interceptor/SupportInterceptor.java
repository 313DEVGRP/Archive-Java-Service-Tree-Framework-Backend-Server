package egovframework.com.ext.jstree.support.interceptor;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import egovframework.com.ext.jstree.support.util.DateUtils;
import egovframework.com.ext.jstree.support.util.StringUtils;

public class SupportInterceptor extends WebContentInterceptor{

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			URL url = new URL(request.getRequestURL().toString());
			String depths = url.getPath();
			if (StringUtils.isEmpty(depths)) {
				return true;
			}        
			
			String[] depthArray = StringUtils.split(depths, "/");
			request.setAttribute("depthArray", depthArray);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
        return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		if (null == modelAndView) {
            return;
        }

        
        URL url = new URL(request.getRequestURL().toString());
        String hostUrl = url.getProtocol() + "://" + url.getHost();
        
        Date now = new Date();
        modelAndView.addObject("hostUrl", hostUrl);
        modelAndView.addObject("prevWeek", DateUtils.addWeeks(now, -1));
        modelAndView.addObject("yesterday", DateUtils.addDays(now, -1));
        modelAndView.addObject("today", now);
        modelAndView.addObject("tommorow", DateUtils.addDays(now, 1));
        modelAndView.addObject("nextWeek", DateUtils.addWeeks(now, 1));
        modelAndView.addObject("nextMonth", DateUtils.addMonths(now, 1));
        
        modelAndView.addObject("queryString", request.getQueryString());
        
    }
    
	@Override
	public void afterCompletion(
			HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
