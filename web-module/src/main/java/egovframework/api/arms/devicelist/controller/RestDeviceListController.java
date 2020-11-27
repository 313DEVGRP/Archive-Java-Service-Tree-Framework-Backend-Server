package egovframework.api.arms.devicelist.controller;

import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    @RequestMapping(value="/restController/{testStr}",method= RequestMethod.GET)
    public ModelAndView getNode(@PathVariable(value ="testStr") String testStr, ModelMap model,
                                HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", testStr);
        return modelAndView;
    }
}
