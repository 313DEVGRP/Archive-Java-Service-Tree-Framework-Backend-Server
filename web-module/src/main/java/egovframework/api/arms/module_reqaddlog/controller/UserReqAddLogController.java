/*
 * @author Dongmin.lee
 * @since 2022-11-19
 * @version 22.11.19
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqaddlog.controller;

import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqreviewlog.model.ReqReviewLogDTO;
import egovframework.com.ext.jstree.springHibernate.core.dao.JsTreeHibernateDao;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_reqaddlog.model.ReqAddLogDTO;
import egovframework.api.arms.module_reqaddlog.service.ReqAddLog;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqAddLog"})
public class UserReqAddLogController extends SHVAbstractController<ReqAddLog, ReqAddLogDTO> {

    @Autowired
    @Qualifier("reqAddLog")
    private ReqAddLog reqAddLog;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqAddLog);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getMonitor(
            ReqAddLogDTO reqAddLogDTO, ModelMap model, HttpServletRequest request) throws Exception {

        reqAddLogDTO.setOrder(Order.asc("c_left"));
        List<ReqAddLogDTO> list = this.reqAddLog.getChildNode(reqAddLogDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getHistory.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getHistory(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        long reqID = parser.getLong("c_id");

        ReqAddLogDTO reqAddLogDTO = new ReqAddLogDTO();
        Criterion criterion = Restrictions.eq("c_id", reqID);
        reqAddLogDTO.getCriterions().add(criterion);

        reqAddLogDTO.setOrder(Order.desc("c_date"));
        SessionUtil.setAttribute("getHistory",changeReqTableName);

        List<ReqAddLogDTO> list = reqAddLog.getChildNode(reqAddLogDTO);

        SessionUtil.removeAttribute("getHistory");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}
