package egovframework.api.arms.datasourcelist.batch;

import egovframework.api.arms.datasourcelist.service.DataSourceListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2021-01-16.
 */
@Component
public class DataSourceListBatch {

    @Autowired
    private DataSourceListService dataSourceListService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Scheduled(fixedDelay=60000*5, initialDelay =20000)
    public void updateDataSourceList() throws Exception {

        Integer updateCount = dataSourceListService.updateDatasourceListToGrafana();
        logger.info("DataSourceList update Count = " + updateCount);
    }


}
