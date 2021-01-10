package egovframework.api.arms.dashboardlist.service;

import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;

/**
 * Created by Administrator on 2021-01-10.
 */
public interface DashboardListService extends JsTreeHibernateService {

    public Integer updateDashboardToGrafana() throws Exception;
}
