package egovframework.api.rivalWar.aggregateResult.service;

import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AggregateResultService {

    public <T extends JsTreeHibernateSearchDTO> T getAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> List<T> getChildAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> List<T> getPaginatedChildAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> List<String> searchAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> T addAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> int removeAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> int alterAggregateResult(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> int alterAggregateResultType(T jsTreeHibernateDTO) throws Exception;

    public <T extends JsTreeHibernateSearchDTO> T moveAggregateResult(T jsTreeHibernateDTO, HttpServletRequest request) throws Exception;

}
