package egovframework.api.rivalWar.notice.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Maps;
import egovframework.api.rivalWar.notice.service.NoticeService;
import egovframework.api.rivalWar.notice.vo.NoticeDTO;
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

/**
 * Created by Administrator on 2017-11-06.
 */
@Controller
@RequestMapping(value = {"/api/rivalWar/notice"})
public class AnonymousNoticeController extends GenericAbstractController {

    @Autowired
    private NoticeService noticeService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @IncludedInfo(name = "RivalWar Admin Notice", listUrl = "/api/rivalWar/notice/getJsTreeView.do", order = 7009, gid = 7313)
    @RequestMapping("/getJsTreeView.do")
    public String getRivalWarNoticeJstreeView() {
        return "egovframework/api/rivalWar/notice/JsTreeView";
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
    public ModelAndView searchNode(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", noticeService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        if (jsTreeHibernateDTO.getC_id() <= 0 || jsTreeHibernateDTO.getPageIndex() <= 0
                || jsTreeHibernateDTO.getPageUnit() <= 0 || jsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", jsTreeHibernateDTO.getC_id());
        List<NoticeDTO> list = noticeService.getPaginatedChildNode(jsTreeHibernateDTO);
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
    public ModelAndView getNode(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
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

        NoticeDTO selectedJsTreeHibernateDTO = noticeService.getNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", selectedJsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getNodeForDatatable.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView getNodeForDatatable(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
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
        List<NoticeDTO> list = new ArrayList<NoticeDTO>();
        list.add(noticeService.getNode(jsTreeHibernateDTO));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<NoticeDTO> list = noticeService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMonitor.do", method = RequestMethod.GET)
    public ModelAndView getMonitor(NoticeDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<NoticeDTO> list = noticeService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}
