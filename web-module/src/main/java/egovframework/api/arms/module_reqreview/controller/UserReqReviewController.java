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
package egovframework.api.arms.module_reqreview.controller;

import egovframework.api.arms.module_pdservicejiraver.model.PdServiceJiraVerDTO;
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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_reqreview.model.ReqReviewDTO;
import egovframework.api.arms.module_reqreview.service.ReqReview;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqReview"})
public class UserReqReviewController extends SHVAbstractController<ReqReview, ReqReviewDTO> {

    @Autowired
    @Qualifier("reqReview")
    private ReqReview reqReview;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqReview);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getMonitor_Without_Root.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getMonitor_Without_Root(ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        String searchReviewer = parser.get("searchReviewer");

        ReqReviewDTO reqReviewDTO = new ReqReviewDTO();
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );

        reqReviewDTO.getCriterions().add(criterion);

        Criterion sender_criterion = Restrictions.or(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_review_sender", Collections.singleton(searchReviewer)),
                Restrictions.in("c_review_responder", Collections.singleton(searchReviewer))
        );
        reqReviewDTO.getCriterions().add(sender_criterion);

        reqReviewDTO.setOrder(Order.desc("c_review_creat_date"));
        List<ReqReviewDTO> list = reqReview.getChildNode(reqReviewDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

}
