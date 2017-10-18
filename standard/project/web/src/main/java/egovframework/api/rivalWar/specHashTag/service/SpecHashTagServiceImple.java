package egovframework.api.rivalWar.specHashTag.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017-10-14.
 */
@Service("SpecHashTagService")
public class SpecHashTagServiceImple {
    @Autowired
    @Qualifier("JsTreeHibernateService")
    private JsTreeHibernateService jsTreeHibernateService;
}
