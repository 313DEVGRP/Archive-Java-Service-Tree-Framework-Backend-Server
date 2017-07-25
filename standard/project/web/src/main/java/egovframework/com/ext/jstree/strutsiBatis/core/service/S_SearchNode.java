package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_SearchNode;
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
 * Class Name 	: S_SearchNode.java
 * Description 	: JSTree의 node정보를 조회하는  I_S_SearchNode interface를 구현한 service
 * Infomation	: 
 *
 * node들 조회한다. 
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
@Service("S_SearchNode")
public class S_SearchNode implements I_S_SearchNode {

	HttpServletRequest request;

	P_ComprehensiveTree p_SearchNodeByPosition;
	List<T_ComprehensiveTree> t_SearchNodeByStrings;
	List<P_ComprehensiveTree> p_SearchNodeByPositions;

	@Resource(name="DB_SearchNode")
	I_DB_SearchNode i_DB_SearchNode;

	public S_SearchNode() {

		p_SearchNodeByPosition = new P_ComprehensiveTree();

		t_SearchNodeByStrings = new ArrayList<T_ComprehensiveTree>();
		p_SearchNodeByPositions = new ArrayList<P_ComprehensiveTree>();

	}

	@Override
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * node를 조회한다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return node 조회 처리에 대한 결과값 (List&lt;String&gt;)
	 * */
	@Override
	public List<String> searchNode(P_ComprehensiveTree p_ComprehensiveTree) {

		t_SearchNodeByStrings.addAll(searchNodeByString(p_ComprehensiveTree));

		for (T_ComprehensiveTree nodeByString : t_SearchNodeByStrings) {
			p_SearchNodeByPositions.add(Util_SwapNode.swapTtoP(nodeByString));
		}

		return searchNodeByPosition(p_SearchNodeByPositions);
	}
	
	/**
	 * node를 문자(String)로 조회한다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return node의 문자조회 처리에 대한 결과값 (List&lt;T_ComprehensiveTree&gt;)
	 * */
	@Override
	public List<T_ComprehensiveTree> searchNodeByString(
			P_ComprehensiveTree p_ComprehensiveTree) {

		String determineDBSetting = selectDBSetting("step1");

		return i_DB_SearchNode.searchNodeByString(p_ComprehensiveTree,
				determineDBSetting);
	}

	/**
	 * node를 position을 조회한다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return node의 position조회 처리에 대한 결과값 (List&lt;String&gt;)
	 * */
	@Override
	public List<String> searchNodeByPosition(
			List<P_ComprehensiveTree> p_SearchNodeByPositions) {

		String determineDBSetting = selectDBSetting("step2");

		return i_DB_SearchNode.searchNodeByPosition(p_SearchNodeByPositions,
				determineDBSetting);
	}

	public String selectDBSetting(String step) {
		String returnStr = "";
		if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/searchNode.action")
				&& step.equals("step1")) {
			returnStr = "jstreeStrutsiBatis.searchNodeByString";
		} else if (request.getRequestURI().equals(
				"/com/ext/jstree/strutsiBatis/core/searchNode.action")
				&& step.equals("step2")) {
			returnStr = "jstreeStrutsiBatis.searchNodeByPosition";
		} else {
			logger.debug(request.getRequestURI());
		}
		return returnStr;
	}

}
