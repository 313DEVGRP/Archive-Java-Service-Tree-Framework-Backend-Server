/*
 * @author Dongmin.lee
 * @since 2022-11-20
 * @version 22.11.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservicelog.controller;

import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_pdservicelog.model.PdServiceLogDTO;
import egovframework.api.arms.module_pdservicelog.service.PdServiceLog;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdServiceLog"})
public class UserPdServiceLogController extends SHVAbstractController<PdServiceLog, PdServiceLogDTO> {

    @Autowired
    @Qualifier("pdServiceLog")
    private PdServiceLog pdServiceLog;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdServiceLog);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getMonitor(
            PdServiceLogDTO pdServiceLogDTO, ModelMap model, HttpServletRequest request) throws Exception {

        pdServiceLogDTO.setOrder(Order.asc("c_left"));
        pdServiceLogDTO.setWhere("c_id", pdServiceLogDTO.getC_id());
        List<PdServiceLogDTO> list = this.pdServiceLog.getChildNode(pdServiceLogDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

}
