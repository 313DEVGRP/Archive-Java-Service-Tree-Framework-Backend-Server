package egovframework.api.arms.dashboardlist.batch;

import egovframework.api.arms.dashboardlist.service.DashboardListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2021-01-16.
 */
@Component
public class DashboardListBatch {

    @Autowired
    private DashboardListService dashboardListService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Scheduled(fixedDelay=60000*5, initialDelay =30000)
    public void updateDashboardList() throws Exception {

        Integer updateCount = dashboardListService.updateDashboardToGrafana();
        logger.info("DataSourceList update Count = " + updateCount);
    }
}
