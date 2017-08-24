package egovframework.api.rivalWar.menu.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;
import egovframework.api.rivalWar.menu.service.MenuService;
import egovframework.api.rivalWar.menu.vo.MenuDTO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
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

    /**
     * 자식노드를 요청한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param request
     * @return String
     * @throws JsonProcessingException
     */
    @IncludedInfo(name = "RivalWar Admin Menu", listUrl = "/api/rivalWar/menu/getJsTreeView.do", order = 7000, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String jsTreeSpringHibernate() {
        return "egovframework/api/rivalWar/menu/JsTreeView";
    }

    /**
     * 노드를 검색한다.
     *
     * @param jsTreeHibernateDTO
     * @param model
     * @param request
     * @return
     * @throws JsonProcessingException
     */
    @ResponseBody
    @RequestMapping(value = "/searchMenu.do", method = RequestMethod.GET)
    public ModelAndView searchNode(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuService.searchMenu(jsTreeHibernateDTO));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildMenu.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildMenu(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<MenuDTO> list = menuService.getPaginatedChildMenu(jsTreeHibernateDTO);
        jsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(list.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", jsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", list);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMenu.do", method = RequestMethod.GET)
    public ModelAndView getMenu(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        MenuDTO menuDTO = menuService.getMenu(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildMenu.do", method = RequestMethod.GET)
    public ModelAndView getChildMenu(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        logger.info("jrebel reload test");

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        logger.info("jrebel reload test #1");

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<MenuDTO> list = menuService.getChildMenu(jsTreeHibernateDTO);

        logger.info("jrebel reload test #3");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getRootMenuCategories.do", method = RequestMethod.GET)
    public ModelAndView getRootMenuCategories(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setC_id(new Long(2));
        MenuDTO menuDTO = menuService.getMenu(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getRecentList.do", method = RequestMethod.GET)
    public ModelAndView getRecentList(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        long rootMenuCid = new Long(3);
        jsTreeHibernateDTO.setC_id(rootMenuCid);
        MenuDTO menuDTO = menuService.getMenu(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getClassifiedMenu.do", method = RequestMethod.GET)
    public ModelAndView getClassifiedMenu(MenuDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        long rootMenuCid = new Long(4);
        jsTreeHibernateDTO.setC_id(rootMenuCid);
        MenuDTO menuDTO = menuService.getMenu(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", menuDTO);
        return modelAndView;
    }

}
