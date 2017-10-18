package egovframework.api.rivalWar.specHashTag.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;
import egovframework.api.rivalWar.specHashTag.service.SpecHashTagService;
import egovframework.api.rivalWar.specHashTag.vo.SpecHashTagDTO;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2017-10-14.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/specHashTag"})
public class AnonymousSpecHashTagController extends GenericAbstractController {

    @Autowired
    private SpecHashTagService specHashTagService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @IncludedInfo(name = "RivalWar Admin SpecHashTag", listUrl = "/api/rivalWar/specHashTag/getJsTreeView.do", order = 7007, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String getRivalWarSpecHashTagJstreeView() {
        return "egovframework/api/rivalWar/specHashTag/JsTreeView";
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
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(SpecHashTagDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", specHashTagService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(SpecHashTagDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<SpecHashTagDTO> list = specHashTagService.getPaginatedChildNode(jsTreeHibernateDTO);
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
    public ModelAndView getNode(SpecHashTagDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

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

        SpecHashTagDTO selectedJsTreeHibernateDTO = specHashTagService.getNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", selectedJsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getNodeForDatatable.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getNodeForDatatable(SpecHashTagDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

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
        List<SpecHashTagDTO> list = new ArrayList<SpecHashTagDTO>();
        list.add(specHashTagService.getNode(jsTreeHibernateDTO));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(SpecHashTagDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<SpecHashTagDTO> list = specHashTagService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}