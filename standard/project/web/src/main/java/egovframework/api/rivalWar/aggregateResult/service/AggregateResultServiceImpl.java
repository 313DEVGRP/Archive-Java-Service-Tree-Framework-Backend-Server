package egovframework.api.rivalWar.aggregateResult.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2017-08-29.
 */

@Service("AggregateResultService")
public class AggregateResultServiceImpl implements AggregateResultService {

    @Autowired
    private JsTreeHibernateService jsTreeHibernateService;

    @Override
    public <T extends JsTreeHibernateSearchDTO> T getAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.getNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> List<T> getChildAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.getPaginatedChildNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> List<String> searchAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.searchNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> T addAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.addNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> int removeAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.removeNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> int alterAggregateResult(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.alterNode(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> int alterAggregateResultType(T jsTreeHibernateDTO) throws Exception {
        return jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
    }

    @Override
    public <T extends JsTreeHibernateSearchDTO> T moveAggregateResult(T jsTreeHibernateDTO, HttpServletRequest request)
            throws Exception {
        return jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
    }
}