package egovframework.api.arms.devicelist.controller;

import egovframework.api.arms.devicelist.service.DeviceListService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2020-11-27.
 */
@RestController
@RequestMapping("/api/v1/devicelist")
public class RestDeviceListController extends GenericAbstractController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DeviceListService deviceListService;

    @RequestMapping(value="/restController/{action}",method= RequestMethod.GET)
    public ModelAndView getNode(@PathVariable(value ="action") String actionStr,ModelMap model,
                                HttpServletRequest request) throws Exception {

        try {
            Integer updateCount = deviceListService.updateDeviceListToJstree();
            logger.info("DeviceList update Count = " + updateCount);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "done");
        return modelAndView;
    }
}
