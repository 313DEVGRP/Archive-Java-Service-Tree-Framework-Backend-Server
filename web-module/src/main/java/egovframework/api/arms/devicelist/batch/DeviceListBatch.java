package egovframework.api.arms.devicelist.batch;

import egovframework.api.arms.devicelist.service.DeviceListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2020-11-22.
 */
@Component
public class DeviceListBatch {

    @Autowired
    private DeviceListService deviceListService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Scheduled(fixedDelay=60000*5, initialDelay =10000)
    public void updateDeviceHost() throws Exception {

        Integer updateCount = deviceListService.updateDeviceListToJstree();
        logger.info("DeviceList update Count = " + updateCount);

    }
}
