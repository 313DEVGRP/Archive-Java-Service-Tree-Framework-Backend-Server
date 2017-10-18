package egovframework.api.rivalWar.menu.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service("MenuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	@Qualifier("JsTreeHibernateService")
	private JsTreeHibernateService jsTreeHibernateService;
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> T getNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);
	}
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getPaginatedChildNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<String> searchNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.searchNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T addNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.addNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int removeNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.removeNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterNode(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterNodeType(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T moveNode(T jsTreeHibernateDTO, HttpServletRequest request)
			throws Exception {
		return jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
	}
}