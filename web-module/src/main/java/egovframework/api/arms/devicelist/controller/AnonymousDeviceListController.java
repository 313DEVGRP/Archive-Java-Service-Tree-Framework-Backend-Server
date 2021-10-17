package egovframework.api.arms.devicelist.controller;

import com.google.common.collect.Maps;
import egovframework.api.arms.devicelist.service.DeviceListService;
import egovframework.api.arms.devicelist.vo.DeviceListDTO;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2020-11-27.
 */
@Controller
@RequestMapping(value = {"/api/devicelist"})
public class AnonymousDeviceListController extends GenericAbstractController {

    @Autowired
    private DeviceListService deviceListService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/getJsTreeView.do")
    public String getDeviceList() {
        return "egovframework/api/devicelist/JsTreeView";
    }

    @ResponseBody
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(DeviceListDTO jsTreeHibernateDTO, ModelMap model,
                                   HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", deviceListService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(DeviceListDTO jsTreeHibernateDTO,
                                              ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<DeviceListDTO> list = deviceListService.getPaginatedChildNode(jsTreeHibernateDTO);
        jsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(list.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", jsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", list);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getNode.do", method = RequestMethod.GET)
    public ModelAndView getNode(DeviceListDTO jsTreeHibernateDTO, ModelMap model,
                                HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        DeviceListDTO menuDTO = deviceListService.getNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(DeviceListDTO jsTreeHibernateDTO, ModelMap model,
                                     HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<DeviceListDTO> list = deviceListService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMonitor.do", method = RequestMethod.GET)
    public ModelAndView getMonitor(DeviceListDTO jsTreeHibernateDTO, ModelMap model,
                                   HttpServletRequest request) throws Exception {

        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<DeviceListDTO> list = deviceListService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public ModelAndView updateList(ModelMap model,
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
