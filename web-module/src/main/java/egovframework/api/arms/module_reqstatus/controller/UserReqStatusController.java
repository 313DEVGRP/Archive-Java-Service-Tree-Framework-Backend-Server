/*
 * @author Dongmin.lee
 * @since 2022-12-03
 * @version 22.12.03
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqstatus.controller;

import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.util.StringUtility;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import egovframework.com.ext.jstree.support.util.StringUtils;
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
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.module_reqstatus.service.ReqStatus;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqStatus"})
public class UserReqStatusController extends SHVAbstractController<ReqStatus, ReqStatusDTO> {

    @Autowired
    @Qualifier("reqStatus")
    private ReqStatus reqStatus;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqStatus);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getStatusMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getStatusMonitor(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            ReqStatusDTO reqStatusDTO, ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        boolean disableChecker = parser.getBoolean("disable");
        if(disableChecker){
            reqStatusDTO.setWhere("c_title", "enable");
        }

        String[] versionTagArr = StringUtility.split(parser.get("versionTag"), ",");
        if( versionTagArr != null){
            List<Long> longList = new ArrayList<>();
            for (String versionTag : versionTagArr ) {
                longList.add(StringUtility.toLong(versionTag));
            }
            Criterion criterion = Restrictions.in("c_version_link", longList);
            reqStatusDTO.getCriterions().add(criterion);
        }


        SessionUtil.setAttribute("getStatusMonitor",changeReqTableName);

        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );
        reqStatusDTO.getCriterions().add(criterion);
        List<ReqStatusDTO> list = reqStatus.getChildNode(reqStatusDTO);

        SessionUtil.removeAttribute("getStatusMonitor");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getStatusNode.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqStatusDTO> ModelAndView getStatusNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName
            ,V reqStatusDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("getStatusNode",changeReqTableName);

            V returnVO = reqStatus.getNode(reqStatusDTO);

            SessionUtil.removeAttribute("getStatusNode");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnVO);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getStatusChildNode.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqStatusDTO> ModelAndView getStatusChildNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName
            ,V reqStatusDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        String[] c_ids = StringUtility.split(parser.get("c_ids"), ",");
        if( c_ids != null){
            List<Long> longList = new ArrayList<>();
            for (String c_id : c_ids ) {
                longList.add(StringUtility.toLong(c_id));
            }
            Criterion criterion = Restrictions.in("c_id", longList);
            reqStatusDTO.getCriterions().add(criterion);
        }

        SessionUtil.setAttribute("getStatusChildNode",changeReqTableName);

        List<V> resultVO_List = reqStatus.getChildNode(reqStatusDTO);

        SessionUtil.removeAttribute("getStatusChildNode");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", resultVO_List);
        return modelAndView;
    }

}
