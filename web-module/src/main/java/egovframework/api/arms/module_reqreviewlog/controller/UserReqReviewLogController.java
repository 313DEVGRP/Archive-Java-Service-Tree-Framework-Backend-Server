/*
 * @author Dongmin.lee
 * @since 2022-12-06
 * @version 22.12.06
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqreviewlog.controller;

import egovframework.api.arms.module_reqaddlog.model.ReqAddLogDTO;
import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.module_reqstatuslog.model.ReqStatusLogDTO;
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

import egovframework.api.arms.module_reqreviewlog.model.ReqReviewLogDTO;
import egovframework.api.arms.module_reqreviewlog.service.ReqReviewLog;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqReviewLog"})
public class UserReqReviewLogController extends SHVAbstractController<ReqReviewLog, ReqReviewLogDTO> {

    @Autowired
    @Qualifier("reqReviewLog")
    private ReqReviewLog reqReviewLog;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqReviewLog);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getHistory.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getHistory(ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        long reqID = parser.getLong("reqID");

        ReqReviewLogDTO reviewLogDTO = new ReqReviewLogDTO();
        reviewLogDTO.setWhere("c_review_pdservice_link", 10L);
        reviewLogDTO.setWhere("c_review_req_link", reqID);
        reviewLogDTO.setOrder(Order.desc("c_date"));

        List<ReqReviewLogDTO> list = reqReviewLog.getChildNodeWithoutPaging(reviewLogDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

}
