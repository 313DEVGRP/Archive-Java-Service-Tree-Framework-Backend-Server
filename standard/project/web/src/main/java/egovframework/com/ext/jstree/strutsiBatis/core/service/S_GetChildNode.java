package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_GetChildNode;
import egovframework.com.ext.jstree.strutsiBatis.core.dto.P_ComprehensiveTree;
import egovframework.com.ext.jstree.strutsiBatis.core.vo.T_ComprehensiveTree;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: S_GetChildNode.java
 * Description 	: JSTree의 node의 하위 node들의 정보를 가져오는  I_S_GetChildNode interface를 구현한 service
 * Infomation	: 
 *
 * node의 하위 node들의 정보를 가져온다. 
 * 
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성 
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * */
@Service("S_GetChildNode")
public class S_GetChildNode implements I_S_GetChildNode {

	static Logger logger = Logger.getLogger(S_GetChildNode.class);

	HttpServletRequest request;
	
	@Resource(name="DB_GetChildNode")
	I_DB_GetChildNode i_DB_GetChildNode;

	public S_GetChildNode() {
	}

	@Override
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * 대상 node의 하위 node의 정보를 가져온다
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 조회결과 값인 하위 노드들의 정보 List<T_ComprehensiveTree>
	 *
	 * */
	@Override
	public List<T_ComprehensiveTree> getChildNode(
			P_ComprehensiveTree p_ComprehensiveTree) {
		String determineDBSetting = selectDBSetting("byID");

		return i_DB_GetChildNode.getChildNode(p_ComprehensiveTree,
				determineDBSetting);
	}
	
	
	/**
	 * 대상 node의 하위 node의 left와 right 값들의 정보를 가져온다
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 조회결과 값인 하위 노드들의 left와 right값 정보 List<T_ComprehensiveTree>
	 *
	 * */
	@Override
	public List<T_ComprehensiveTree> getChildNodeByLeftRight(
			P_ComprehensiveTree p_ComprehensiveTree) {

		String determineDBSetting = selectDBSetting("byLeftRight");

		return i_DB_GetChildNode.getChildNodeByLeftRight(p_ComprehensiveTree,
				determineDBSetting);
	}

	public String selectDBSetting(String flag) {
		String returnStr = "";
		if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/getChildNode.action")
				&& flag.equals("byID")) {
			returnStr = "jstreeStrutsiBatis.getChildNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/alterNodeType.action")
				&& flag.equals("byID")) {
			returnStr = "jstreeStrutsiBatis.getChildNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/moveNode.action")
				&& flag.equals("byID")) {
			returnStr = "jstreeStrutsiBatis.getChildNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/moveNode.action")
				&& flag.equals("byLeftRight")) {
			returnStr = "jstreeStrutsiBatis.getChildNodeByLeftRight";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/addNode.action")
				&& flag.equals("byID")) {
			returnStr = "jstreeStrutsiBatis.getChildNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/addNode.action")
				&& flag.equals("byLeftRight")) {
			returnStr = "jstreeStrutsiBatis.getChildNodeByLeftRight";
		} else {
			logger.debug(request.getRequestURI());
		}
		return returnStr;
	}

}
