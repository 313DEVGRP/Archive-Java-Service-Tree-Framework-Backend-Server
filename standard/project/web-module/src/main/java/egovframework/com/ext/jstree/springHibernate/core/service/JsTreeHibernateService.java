package egovframework.com.ext.jstree.springHibernate.core.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

public interface JsTreeHibernateService {
	
	public <T extends JsTreeHibernateSearchDTO> T getNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> List<T> getChildNode(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> List<String> searchNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> T addNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> int removeNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> int alterNode(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> int alterNodeType(T jsTreeHibernateDTO) throws Exception;

	public <T extends JsTreeHibernateSearchDTO> T moveNode(T jsTreeHibernateDTO, HttpServletRequest request) throws Exception;
}
