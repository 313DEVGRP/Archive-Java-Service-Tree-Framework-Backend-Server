package egovframework.com.ext.jstree.springmyBatis.core.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.com.ext.jstree.springmyBatis.core.vo.ComprehensiveTree;

/**
 * Modification Information
 * 
 * @author ?
 * @since 2014. 7. 31.
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: CoreService.java
 * 	Description : jstree Spring + iBatis 버젼의 서비스 인터페이스
 * 	Infomation	: jstree 에서 node를 add,search,delete 등의 행동을 하는 서비스
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014. 7. 31.      ?        최초 생성
 *  2015. 7. 31. 류강하               getCountOfDescendantNodes, getDescendantNodesPaginated 메서드 추가
 * 
 *  Copyright (C) 2014 by 313 DeveloperGroup  All right reserved.
 * </pre>
 */
public interface CoreService {

	public <T extends ComprehensiveTree> T getNode(T comprehensiveTree) throws Exception;

	/**
	 * 자식노드를 요청한다.
	 * 
	 * @param <T>
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return List<ComprehensiveTree> 자식 노드들
	 */
	public <T extends ComprehensiveTree> List<T> getChildNode(T comprehensiveTree) throws Exception;

	/**
	 * 노드를 검색한다.
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return List<String> - 검색된 노드들
	 */
	public <T extends ComprehensiveTree> List<String> searchNode(T comprehensiveTree) throws Exception;

	/**
	 * 노드를 추가한다.
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return ComprehensiveTree
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public <T extends ComprehensiveTree> T addNode(T comprehensiveTree) throws Exception;

	/**
	 * 노드를 삭제한다.
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends ComprehensiveTree> int removeNode(T comprehensiveTree) throws Exception;

	/**
	 * 노드를 변경한다.
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends ComprehensiveTree> int alterNode(T comprehensiveTree) throws Exception;

	/**
	 * 노드의 타입을 변경한다.
	 * 
	 * @param comprehensiveTree
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends ComprehensiveTree> int alterNodeType(T comprehensiveTree) throws Exception;

	/**
	 * 노드를 이동한다.
	 * 
	 * @param comprehensiveTree
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public <T extends ComprehensiveTree> T moveNode(T comprehensiveTree, HttpServletRequest request) throws Exception;
}