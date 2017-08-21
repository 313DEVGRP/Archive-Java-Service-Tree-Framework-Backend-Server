package egovframework.api.rivalWar.directChat.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service("DirectChatService")
public class DirectChatServiceImpl implements DirectChatService {

	@Autowired
	private JsTreeHibernateService jsTreeHibernateService;
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> T getDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getNode(jsTreeHibernateDTO);
	}
	
	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getPaginatedChildNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<T> getChildDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> List<String> searchDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.searchNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T addDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.addNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int removeDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.removeNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterDirectChat(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNode(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> int alterDirectChatType(T jsTreeHibernateDTO) throws Exception {
		return jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
	}

	@Override
	public <T extends JsTreeHibernateSearchDTO> T moveDirectChat(T jsTreeHibernateDTO, HttpServletRequest request)
			throws Exception {
		return jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
	}
}