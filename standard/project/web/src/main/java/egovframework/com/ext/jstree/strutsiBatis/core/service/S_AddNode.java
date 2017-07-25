package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_AddNode;
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
 * Class Name 	: S_AddNode.java
 * Description 	: JSTree의 node를 추가하는 I_S_AddNode interface를 구현한 service
 * Infomation	: 
 *
 * node 추가를 위하여 node정보와 해당node의 하위 정보를 가지고 와서 update
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
@Service("S_AddNode")
public class S_AddNode implements I_S_AddNode {

	static Logger logger = Logger.getLogger(S_AddNode.class);

	HttpServletRequest request;
	
	@Resource(name="S_GetNode")
	I_S_GetNode i_S_GetNode;
	
	@Resource(name="S_GetChildNode")
	I_S_GetChildNode i_S_GetChildNode;
	
	@Resource(name="DB_AddNode")
	I_DB_AddNode i_DB_AddNode;

	public S_AddNode() {

	}

	@Override
	public void setRequest(HttpServletRequest request) {

		this.request = request;
	}

	@Override
	public T_ComprehensiveTree addNode(P_ComprehensiveTree p_ComprehensiveTree) {

		i_S_GetNode.setRequest(request);
		T_ComprehensiveTree nodeById = i_S_GetNode.getNode(p_ComprehensiveTree,
				"getNode");

		T_ComprehensiveTree nodeByRef = i_S_GetNode.getNodeByRef(
				p_ComprehensiveTree, "getNodeByRef");

		i_S_GetChildNode.setRequest(request);
		List<T_ComprehensiveTree> childNodesFromNodeByRef = i_S_GetChildNode
				.getChildNode(Util_SwapNode.swapTtoP(nodeByRef));

		return i_DB_AddNode.addNode(p_ComprehensiveTree, nodeById, nodeByRef,
				childNodesFromNodeByRef);
	}

}
