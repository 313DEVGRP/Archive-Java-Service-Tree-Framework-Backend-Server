package egovframework.com.ext.jstree.support.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.ext.jstree.support.util.ParameterParser;

public abstract class GenericAbstractController {

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	@Autowired
	private DefaultBeanValidator defaultBeanValidator;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ParameterParser getParameterParser(HttpServletRequest request){
		return new ParameterParser(request);
	}

	public <T> T invokeBeanValidate(T clazz, BindingResult bindingResult) {
		defaultBeanValidator.validate(clazz, bindingResult);
		if (bindingResult.hasErrors()) { // 만일 validation 에러가 있으면...
			logger.error(clazz.getClass() + " validate error");
			return clazz;
		}
		return clazz;
	}

	@ExceptionHandler(Exception.class)
	public void defenceException(Exception ex, HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "must-revalidate, no-store, no-cache");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 0);
		Gson gson = new GsonBuilder().serializeNulls().create();
                out.println(gson.toJson(map));
                out.flush();
                out.close();
                return;
	}

	@ExceptionHandler(RuntimeException.class)
	public void defenceRuntimeException(RuntimeException ex, HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "must-revalidate, no-store, no-cache");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
                response.setContentType("application/json; charset=UTF-8");
                PrintWriter out = response.getWriter();
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("status", 0);
                Gson gson = new GsonBuilder().serializeNulls().create();
                out.println(gson.toJson(map));
                out.flush();
                out.close();
                return;
	}

}
