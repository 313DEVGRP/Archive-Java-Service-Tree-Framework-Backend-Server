package egovframework.com.ext.jstree.strutsiBatis.core.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_GetNode;
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
 * Class Name 	: S_GetNode.java
 * Description 	: JSTree의 node정보를 가져오는  I_S_GetNode interface를 구현한 service
 * Infomation	: 
 *
 * node들의 정보를 가져온다. 
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
@Service("S_GetNode")
public class S_GetNode implements I_S_GetNode {

	static Logger logger = Logger.getLogger(S_GetChildNode.class);

	HttpServletRequest request;
	
	@Resource(name="DB_GetNode")
	I_DB_GetNode i_DB_GetNode;
	

	public S_GetNode() {
		//i_DB_GetNode = new DB_GetNode();
	}

	@Override
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * node의 정보를 가져온다
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param 목적에 따른 String(flag)
	 * @return 조회한 결과 T_ComprehensiveTree
	 * */
	@Override
	public T_ComprehensiveTree getNode(P_ComprehensiveTree p_ComprehensiveTree,
			String flag) {
		String determineDBSetting = this.selectDBSetting(flag);

		return i_DB_GetNode.getNode(p_ComprehensiveTree, determineDBSetting);
	}
	
	/**
	 * node의 target 위치의 정보를 가져온다
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @param 목적에 따른 String(flag)
	 * @return 조회한 결과 T_ComprehensiveTree
	 * */
	@Override
	public T_ComprehensiveTree getNodeByRef(
			P_ComprehensiveTree p_ComprehensiveTree, String flag) {
		String determineDBSetting = this.selectDBSetting(flag);

		return i_DB_GetNode.getNodeByRef(p_ComprehensiveTree,
				determineDBSetting);
	}

	public String selectDBSetting(String flag) {
		// TODO : 리퀘스트에 따라서 DB 설정파일을 불러와서 선택적 리턴을 해야 함.
		String returnStr = "";
		if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/removeNode.action")
				&& flag.equals("remove")) {
			returnStr = "jstreeStrutsiBatis.getNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/moveNode.action")
				&& flag.equals("getNode")) {
			returnStr = "jstreeStrutsiBatis.getNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/moveNode.action")
				&& flag.equals("getNodeByRef")) {
			returnStr = "jstreeStrutsiBatis.getNodeByRef";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/addNode.action")
				&& flag.equals("getNode")) {
			returnStr = "jstreeStrutsiBatis.getNode";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/addNode.action")
				&& flag.equals("getNodeByRef")) {
			returnStr = "jstreeStrutsiBatis.getNodeByRef";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/alterNodeType.action")
				&& flag.equals("getNode")) {
			returnStr = "jstreeStrutsiBatis.getNode";
		} else {
			logger.debug(request.getRequestURI());
			throw new RuntimeException();
		}
		return returnStr;
	}

}
