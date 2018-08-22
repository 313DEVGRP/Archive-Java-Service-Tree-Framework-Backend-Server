/* Copyright (C) 313 DEV GRP, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by 313 developer group <313@313.co.kr>, December 2010
 */
package egovframework.com.jstree.springHibernate.core.controller;

import com.google.common.collect.Maps;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.ext.jstree.springHibernate.core.service.JsTreeHibernateService;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.*;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateDTO;
import egovframework.com.ext.jstree.support.mvc.GenericAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = {"/com/ext/jstree/springHibernate/core"})
public class JsTreeHibernateController extends GenericAbstractController {

    @Autowired
    @Qualifier("JsTreeHibernateService")
    private JsTreeHibernateService jsTreeHibernateService;

    @IncludedInfo(name = "Spring-Hibernate Ver.", listUrl = "/com/ext/jstree/springHibernate/core/getJsTreeView.do", order = 3360, gid = 313)
    @RequestMapping("/getJsTreeView.do")
    public String jsTreeSpringHibernate() {
        return "egovframework/com/ext/jstree/springHibernateVersion";
    }

    @ResponseBody
    @RequestMapping(value = "/getChildNode.do", method = RequestMethod.GET)
    public ModelAndView getChildNode(JsTreeHibernateDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
        List<JsTreeHibernateDTO> list = jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getPaginatedChildNode.do", method = RequestMethod.GET)
    public ModelAndView getPaginatedChildNode(JsTreeHibernateDTO paginatedJsTreeHibernateDTO, ModelMap model,
                                              HttpServletRequest request) throws Exception {

        if (paginatedJsTreeHibernateDTO.getC_id() <= 0 || paginatedJsTreeHibernateDTO.getPageIndex() <= 0
                || paginatedJsTreeHibernateDTO.getPageUnit() <= 0 || paginatedJsTreeHibernateDTO.getPageSize() <= 0) {
            throw new RuntimeException();
        }
        paginatedJsTreeHibernateDTO.setWhere("c_parentid", paginatedJsTreeHibernateDTO.getC_id());
        List<JsTreeHibernateDTO> resultChildNodes = jsTreeHibernateService.getPaginatedChildNode(paginatedJsTreeHibernateDTO);
        paginatedJsTreeHibernateDTO.getPaginationInfo().setTotalRecordCount(resultChildNodes.size());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", paginatedJsTreeHibernateDTO.getPaginationInfo());
        resultMap.put("result", resultChildNodes);
        modelAndView.addObject("result", resultMap);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/searchNode.do", method = RequestMethod.GET)
    public ModelAndView searchNode(JsTreeHibernateDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (!StringUtils.hasText(request.getParameter("searchString"))) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setWhereLike("c_title", parser.get("parser"));
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateService.searchNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/addNode.do", method = RequestMethod.POST)
    public ModelAndView addNode(@Validated(value = AddNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateService.addNode(jsTreeHibernateDTO));
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/removeNode.do", method = RequestMethod.POST)
    public ModelAndView removeNode(@Validated(value = RemoveNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                   BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateDTO.setStatus(jsTreeHibernateService.removeNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    private void setJsonDefaultSetting(JsTreeHibernateDTO jsTreeHibernateDTO) {
        long defaultSettingValue = 0;
        jsTreeHibernateDTO.setC_parentid(defaultSettingValue);
        jsTreeHibernateDTO.setC_position(defaultSettingValue);
        jsTreeHibernateDTO.setC_left(defaultSettingValue);
        jsTreeHibernateDTO.setC_right(defaultSettingValue);
        jsTreeHibernateDTO.setC_level(defaultSettingValue);
        jsTreeHibernateDTO.setRef(defaultSettingValue);
    }

    @ResponseBody
    @RequestMapping(value = "/alterNode.do", method = RequestMethod.POST)
    public ModelAndView alterNode(@Validated(value = AlterNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                  BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        }

        jsTreeHibernateDTO.setC_title(Util_TitleChecker.StringReplace(jsTreeHibernateDTO.getC_title()));

        jsTreeHibernateDTO.setStatus(jsTreeHibernateService.alterNode(jsTreeHibernateDTO));
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/alterNodeType.do", method = RequestMethod.POST)
    public ModelAndView alterNodeType(@Validated(value = AlterNodeType.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                      BindingResult bindingResult, ModelMap model) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateService.alterNodeType(jsTreeHibernateDTO);
        setJsonDefaultSetting(jsTreeHibernateDTO);
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/moveNode.do", method = RequestMethod.POST)
    public ModelAndView moveNode(@Validated(value = MoveNode.class) JsTreeHibernateDTO jsTreeHibernateDTO,
                                 BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        jsTreeHibernateService.moveNode(jsTreeHibernateDTO, request);
        setJsonDefaultSetting(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", jsTreeHibernateDTO);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/analyzeNode.do", method = RequestMethod.GET)
    public ModelAndView analyzeNode(ModelMap model) {
        model.addAttribute("analyzeResult", "");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "ture");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "/getMonitor.do", method = RequestMethod.GET)
    public ModelAndView getMonitor(JsTreeHibernateDTO jsTreeHibernateDTO, ModelMap model, HttpServletRequest request)
            throws Exception {

        jsTreeHibernateDTO.setOrder(Order.asc("c_id"));
        List<JsTreeHibernateDTO> list = jsTreeHibernateService.getChildNode(jsTreeHibernateDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

}
