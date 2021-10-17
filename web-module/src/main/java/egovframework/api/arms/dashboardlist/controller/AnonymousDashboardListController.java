package egovframework.api.arms.dashboardlist.controller;

import egovframework.api.arms.dashboardlist.service.DashboardListService;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2021-01-10.
 */
@Controller
@RequestMapping(value = {"/api/dashboardlist"})
public class AnonymousDashboardListController extends GenericAbstractController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DashboardListService dashboardListService;

    @RequestMapping("/getJsTreeView.do")
    public String getDashboardList() {
        return "egovframework/api/dashboardlist/JsTreeView";
    }

    @ResponseBody
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public ModelAndView updateList(ModelMap model,
                                   HttpServletRequest request) throws Exception {

        try {
            Integer updateCount = dashboardListService.updateDashboardToGrafana();
            logger.info("DashboardList update Count = " + updateCount);
        } catch (Exception e) {
            e.printStackTrace();
        }


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "done");
        return modelAndView;
    }
}
