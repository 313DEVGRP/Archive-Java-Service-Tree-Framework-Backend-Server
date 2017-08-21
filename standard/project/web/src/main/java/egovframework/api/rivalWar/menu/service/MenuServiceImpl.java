package egovframework.api.rivalWar.menu.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service("MenuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	private JsTreeHibernateService jsTreeHibernateService;
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> T getMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);
	}
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getPaginatedChildNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<String> searchMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.searchNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T addMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.addNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int removeMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.removeNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterMenu(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterMenuType(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T moveMenu(T jsTreeHibernateDTO, HttpServletRequest request)
			throws Exception {
		return jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
	}
}