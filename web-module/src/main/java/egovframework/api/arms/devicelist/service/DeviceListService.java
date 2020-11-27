package egovframework.api.arms.devicelist.service;

import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;

import java.util.HashSet;

/**
 * Created by Administrator on 2020-11-08.
 */
public interface DeviceListService extends JsTreeHibernateService {

    //database jstree method 를 활용하여 full list를 얻어온다. -> 디비에 등록된 host full list
    //elasticsearch api 를 활용해서 full list 를 얻어온다. -> ELK에 등록된 host full list
    //차집합을 통해 디비에 등록할 리스트를 추린다.
    //추려진 데이터를 jstree method api를 통해 업데이트 한다.

    public HashSet<DeviceListDTO> getDeviceListsFromJstree () throws Exception;
    public HashSet<DeviceListDTO> getDeviceListsFromELK () throws Exception;
    public HashSet<DeviceListDTO> getDeviceListDifferrence (HashSet<DeviceListDTO> jstreeDeviceList, HashSet<DeviceListDTO> elkDeviceLists) throws Exception;
    public Integer updateDeviceListToJstree (HashSet<DeviceListDTO> updateTargets) throws Exception;
}
