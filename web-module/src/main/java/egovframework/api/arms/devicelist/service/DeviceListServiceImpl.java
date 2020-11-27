package egovframework.api.arms.devicelist.service;

import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.HashSet;

/**
 * Created by Administrator on 2020-11-08.
 */
@Component
public class DeviceListServiceImpl extends JsTreeHibernateServiceImpl implements DeviceListService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public HashSet<DeviceListDTO> getDeviceListsFromJstree() throws Exception {
        return null;
    }

    @Override
    public HashSet<DeviceListDTO> getDeviceListsFromELK() throws Exception {
        return null;
    }

    @Override
    public HashSet<DeviceListDTO> getDeviceListDifferrence(HashSet<DeviceListDTO> jstreeDeviceList, HashSet<DeviceListDTO> elkDeviceLists) throws Exception {
        return null;
    }

    @Override
    public Integer updateDeviceListToJstree(HashSet<DeviceListDTO> updateTargets) throws Exception {
        return null;
    }
}
