package egovframework.api.rivalWar.menu.controller;

import com.google.common.collect.Maps;
import egovframework.api.rivalWar.aggregateResult.vo.AggregateResultDTO;
import egovframework.api.rivalWar.compareInfo.vo.CompareInfoDTO;
import egovframework.api.rivalWar.compareSpec.vo.CompareSpecDTO;
import egovframework.api.rivalWar.menu.service.MenuService;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
import egovframework.com.cmm.annotation.IncludedInfo;
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

@Controller
@RequestMapping(value = {"/api/rivalWar/menu"})
public class AnonymousMenuController extends GenericAbstractController {

    @Autowired
    private MenuService menuService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @IncludedInfo(name = "RivalWar Admin Menu", listUrl = "/api/rivalWar/menu/getJsTreeView.do", order = 7000, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String getRivalWarMenu() {
        return "egovframework/api/rivalWar/menu/JsTreeView";
    }

    @ResponseBody
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<MenuDTO> list = menuService.getPaginatedChildNode(jsTreeHibernateDTO);
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
    public ModelAndView getNode(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        MenuDTO menuDTO = menuService.getNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMonitor.do", method = RequestMethod.GET)
    public ModelAndView getMonitor(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getRootMenuCategories.do", method = RequestMethod.GET)
    public ModelAndView getRootNodeCategories(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(2));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getRecentList.do", method = RequestMethod.GET)
    public ModelAndView getRecentList(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(3));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getRootAggregateResult.do", method = RequestMethod.GET)
    public ModelAndView getRootAggregateResult(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(3));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);
        if(list.size() > 0){
            MenuDTO tempMenuDTO = list.get(0);
            AggregateResultDTO resultDTO = tempMenuDTO.getAggregateResultDTO();
            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", resultDTO);
            return modelAndView;
        }else{
            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", "none exist childnode");
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getRootCompareInfo.do", method = RequestMethod.GET)
    public ModelAndView getRootCompareInfo(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(3));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);
        if(list.size() > 0){
            MenuDTO tempMenuDTO = list.get(0);
            CompareInfoDTO resultDTO = tempMenuDTO.getCompareInfoDTO();
            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", resultDTO);
            return modelAndView;
        }else{
            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", "none exist childnode");
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getRootCompareSpec.do", method = RequestMethod.GET)
    public ModelAndView getRootCompareSpec(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(3));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);
        if(list.size() > 0){
            MenuDTO tempMenuDTO = list.get(0);
            CompareSpecDTO resultDTO = tempMenuDTO.getCompareSpecDTO();
            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", resultDTO);
            return modelAndView;
        }else{
            ModelAndView modelAndView = new ModelAndView("jsonView");


            modelAndView.addObject("result", "none exist childnode");
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getClassifiedMenu.do", method = RequestMethod.GET)
    public ModelAndView getClassifiedMenu(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(4));
        List<MenuDTO> list = menuService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

}
