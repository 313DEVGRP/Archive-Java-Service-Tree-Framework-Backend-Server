/*
 * @author Dongmin.lee
 * @since 2022-12-20
 * @version 22.12.20
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqcomment.controller;

import egovframework.api.arms.module_reqcomment.model.ReqCommentDTO;
import egovframework.api.arms.module_reqcomment.service.ReqComment;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqComment"})
public class UserReqCommentController extends SHVAbstractController<ReqComment, ReqCommentDTO> {

    @Autowired
    @Qualifier("reqComment")
    private ReqComment reqComment;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqComment);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getComment.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getComment(ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        long c_review_link = parser.getLong("c_id");
        long c_pdservice_link = parser.getLong("c_review_pdservice_link");
        long c_req_link = parser.getLong("c_review_req_link");

        ReqCommentDTO searchReqCommentDTO = new ReqCommentDTO();
        searchReqCommentDTO.setWhere("c_pdservice_link", c_pdservice_link);
        searchReqCommentDTO.setWhere("c_req_link", c_req_link);
        searchReqCommentDTO.setWhere("c_review_link", c_review_link);
        List<ReqCommentDTO> resultList = reqComment.getChildNode(searchReqCommentDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", resultList);
        return modelAndView;
    }
}
