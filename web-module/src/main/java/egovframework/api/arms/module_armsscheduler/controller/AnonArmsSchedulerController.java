/*
 * @author Dongmin.lee
 * @since 2022-12-02
 * @version 22.12.02
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_armsscheduler.controller;

import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_armsscheduler.model.ArmsSchedulerDTO;
import egovframework.api.arms.module_armsscheduler.service.ArmsScheduler;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-anon/api/arms/armsScheduler"})
public class AnonArmsSchedulerController extends SHVAbstractController<ArmsScheduler, ArmsSchedulerDTO> {

    @Autowired
    @Qualifier("armsScheduler")
    private ArmsScheduler armsScheduler;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(armsScheduler);
    }

    @ResponseBody
    @RequestMapping(
            value = {"/set_jiraProject_toPdServiceJira.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView set_jiraProject_toPdServiceJira(ModelMap model, HttpServletRequest request) throws Exception {
        armsScheduler.set_jiraProject_toPdServiceJira();
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "set_jiraProject_toPdServiceJira");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/set_PdServiceVersion_toJiraProjectVersion.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView set_PdServiceVersion_toJiraProjectVersion(ModelMap model, HttpServletRequest request) throws Exception {
        armsScheduler.set_PdServiceVersion_toJiraProjectVersion();
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "set_PdServiceVersion_toJiraProjectVersion");
        return modelAndView;
    }

}
