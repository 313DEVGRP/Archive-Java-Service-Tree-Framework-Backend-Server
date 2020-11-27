package egovframework.api.arms.devicelist.service;

import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2020-11-08.
 */
@Component
public class DeviceListServiceImpl extends JsTreeHibernateServiceImpl implements DeviceListService{

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

}
