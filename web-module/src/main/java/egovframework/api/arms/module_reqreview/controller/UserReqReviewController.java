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

import com.google.common.collect.Maps;
import egovframework.api.arms.module_pdservicejiraver.model.PdServiceJiraVerDTO;
import egovframework.api.arms.util.StringUtility;
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
import java.util.*;

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

        /**
         * Required Fields
         * - 이 필드들은 페이징 계산을 위해 반드시 입력되어야 하는 필드 값들이다.
         *
         * currentPageNo : 현재 페이지 번호
         * recordCountPerPage : 한 페이지당 게시되는 게시물 건 수
         * pageSize : 페이지 리스트에 게시되는 페이지 건수,
         * totalRecordCount : 전체 게시물 건 수.
         */



        String searchReviewer = parser.get("reviewer");

        ReqReviewDTO reqReviewDTO = new ReqReviewDTO();
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );

        reqReviewDTO.getCriterions().add(criterion);

        String filter = parser.get("filter");
        if(StringUtility.equals(filter, "All")){
            Criterion filter_criterion = Restrictions.or(
                    // replace "id" below with property name, depending on what you're filtering against
                    Restrictions.in("c_review_sender", Collections.singleton(searchReviewer)),
                    Restrictions.in("c_review_responder", Collections.singleton(searchReviewer))
            );
            reqReviewDTO.getCriterions().add(filter_criterion);
        }else if(StringUtility.equals(filter, "In-Review")){
            Criterion filter_criterion = Restrictions.or(
                    // replace "id" below with property name, depending on what you're filtering against
                    Restrictions.in("c_review_responder", Collections.singleton(searchReviewer))
            );
            reqReviewDTO.getCriterions().add(filter_criterion);
        }else if(StringUtility.equals(filter, "Out-Review")){
            Criterion filter_criterion = Restrictions.or(
                    // replace "id" below with property name, depending on what you're filtering against
                    Restrictions.in("c_review_sender", Collections.singleton(searchReviewer))
            );
            reqReviewDTO.getCriterions().add(filter_criterion);
        }else if(StringUtility.equals(filter, "Complete")){
            Criterion filter_criterion = Restrictions.or(
                    // replace "id" below with property name, depending on what you're filtering against
                    Restrictions.in("c_review_result_state", Collections.singleton("Complete"))
            );
            reqReviewDTO.getCriterions().add(filter_criterion);
        }


        reqReviewDTO.setOrder(Order.desc("c_review_creat_date"));
        List<ReqReviewDTO> list = reqReview.getChildNode(reqReviewDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        HashMap<String, Object> resultMap = Maps.newHashMap();
        resultMap.put("paginationInfo", list.get(0).getPaginationInfo());
        resultMap.put("result", list);
        modelAndView.addObject("result", resultMap);

        return modelAndView;
    }

}
