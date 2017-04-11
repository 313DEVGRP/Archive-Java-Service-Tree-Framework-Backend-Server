package egovframework.com.ext.jstree.strutsiBatis.core.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.ext.jstree.strutsiBatis.core.dao.I_DB_MoveNode;
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
 * Class Name 	: S_MoveNode.java
 * Description 	: JSTree의 node를 이동하는  I_S_MoveNode interface를 구현한 service
 * Infomation	: 
 *
 * node들을 이동한다. 
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
@Service("S_MoveNode")
public class S_MoveNode implements I_S_MoveNode {

	static Logger logger = Logger.getLogger(S_MoveNode.class);

	HttpServletRequest request;

	@Resource(name="DB_MoveNode")
	I_DB_MoveNode i_DB_MoveNode;
	
	@Resource(name="S_GetNode")
	I_S_GetNode i_S_GetNode;
	
	@Resource(name="S_GetChildNode")
	I_S_GetChildNode i_S_GetChildNode;

	public S_MoveNode() {
		//i_DB_MoveNode = new DB_MoveNode();
		//i_S_GetNode = new S_GetNode();
		//i_S_GetChildNode = new S_GetChildNode();
	}

	@Override
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * node를 이동한다.
	 * 
	 * @param P_ComprehensiveTree(p_ComprehensiveTree)
	 * @return 조회한 결과 T_ComprehensiveTree
	 * */
	@Override
	public T_ComprehensiveTree moveNode(P_ComprehensiveTree p_ComprehensiveTree) {

		i_S_GetNode.setRequest(request);
		T_ComprehensiveTree nodeById = i_S_GetNode.getNode(p_ComprehensiveTree,
				"getNode");
		i_S_GetChildNode.setRequest(request);
		List<T_ComprehensiveTree> childNodesFromNodeById = i_S_GetChildNode
				.getChildNodeByLeftRight(Util_SwapNode.swapTtoP(nodeById));

		T_ComprehensiveTree nodeByRef = i_S_GetNode.getNodeByRef(
				p_ComprehensiveTree, "getNodeByRef");
		List<T_ComprehensiveTree> childNodesFromNodeByRef = i_S_GetChildNode
				.getChildNode(Util_SwapNode.swapTtoP(nodeByRef));

		i_DB_MoveNode.setRequest(request);
		return i_DB_MoveNode.moveNode(p_ComprehensiveTree, nodeById,
				childNodesFromNodeById, nodeByRef, childNodesFromNodeByRef);

	}

}
