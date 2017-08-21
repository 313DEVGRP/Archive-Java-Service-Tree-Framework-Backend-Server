package egovframework.api.rivalWar.menu.service;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface MenuService {
	
	public <T extends JsTreeHibernateSearchDTO> T getMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> List<String> searchMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> T addMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int removeMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int alterMenu(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> int alterMenuType(T jsTreeHibernateDTO) throws Exception;
	
	public <T extends JsTreeHibernateSearchDTO> T moveMenu(T jsTreeHibernateDTO, HttpServletRequest request) throws Exception;

}
