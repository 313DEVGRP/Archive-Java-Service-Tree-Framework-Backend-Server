package egovframework.com.ext.jstree.springHibernate.core.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

public interface JsTreeHibernateService {
	
	public <T extends JsTreeHibernateSearchDTO> T getNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 자식노드를 요청한다.
	 * 
	 * @param <T>
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return List<jsTreeHibernateDTO> 자식 노드들
	 */
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildNode(T jsTreeHibernateDTO) throws Exception;
	
	/**
	 * 자식노드를 요청한다.
	 * 
	 * @param <T>
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return List<jsTreeHibernateDTO> 자식 노드들
	 */
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드를 검색한다.
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return List<String> - 검색된 노드들
	 */
	public <T extends JsTreeHibernateSearchDTO> List<String> searchNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드를 추가한다.
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return jsTreeHibernateDTO
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public <T extends JsTreeHibernateSearchDTO> T addNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드를 삭제한다.
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends JsTreeHibernateSearchDTO> int removeNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드를 변경한다.
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends JsTreeHibernateSearchDTO> int alterNode(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드의 타입을 변경한다.
	 * 
	 * @param jsTreeHibernateDTO
	 *            - jstree에서 사용되는 tree VO
	 * @return int
	 */
	public <T extends JsTreeHibernateSearchDTO> int alterNodeType(T jsTreeHibernateDTO) throws Exception;

	/**
	 * 노드를 이동한다.
	 * 
	 * @param jsTreeHibernateDTO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public <T extends JsTreeHibernateSearchDTO> T moveNode(T jsTreeHibernateDTO, HttpServletRequest request) throws Exception;
}
