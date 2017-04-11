package egovframework.rivalwar.api.directChat.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

public interface DirectChatService {
	
	public <T extends JsTreeHibernateSearchDTO> T getDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<String> searchDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> T addDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int removeDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int alterDirectChat(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int alterDirectChatType(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> T moveDirectChat(T jsTreeHibernateDTO, HttpServletRequest request) throws Exception;

}
