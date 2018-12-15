package egovframework.api.rivalWar.compareItem.controller;

import com.google.common.collect.Maps;
import egovframework.api.rivalWar.compareItem.service.CompareItemService;
import egovframework.api.rivalWar.compareItem.vo.CompareItemDTO;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = {"/api/rivalWar/compareItem"})
public class AnonymousCompareItemController extends GenericAbstractController {

    @Autowired
    private CompareItemService compareItemService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @IncludedInfo(name = "RivalWar Admin CompareItem", listUrl = "/api/rivalWar/compareItem/getJsTreeView.do", order = 7005, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String getRivalWarCompareItemJstreeView() {
        return "egovframework/api/rivalWar/compareItem/JsTreeView";
    }

    @ResponseBody
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", compareItemService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<CompareItemDTO> list = compareItemService.getPaginatedChildNode(jsTreeHibernateDTO);
        jsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(list.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", jsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", list);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getNode.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getNode(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if(request.getMethod().equals("GET")){
            ParameterParser parser = new ParameterParser(request);

            if (parser.getInt("c_id") <= 0 ) {
                throw new RuntimeException();
            }
        }else{
            if(jsTreeHibernateDTO.getC_id() <= 0){
                throw new RuntimeException();
            }
        }

        CompareItemDTO selectedJsTreeHibernateDTO = compareItemService.getNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", selectedJsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getNodeForDatatable.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getNodeForDatatable(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if(request.getMethod().equals("GET")){
            ParameterParser parser = new ParameterParser(request);

            if (parser.getInt("c_id") <= 0 ) {
                throw new RuntimeException();
            }
        }else{
            if(jsTreeHibernateDTO.getC_id() <= 0){
                throw new RuntimeException();
            }
        }
        List<CompareItemDTO> list = new ArrayList<CompareItemDTO>();
        list.add(compareItemService.getNode(jsTreeHibernateDTO));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<CompareItemDTO> list = compareItemService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMonitor.do", method = RequestMethod.GET)
    public ModelAndView getMonitor(CompareItemDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<CompareItemDTO> list = compareItemService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}
