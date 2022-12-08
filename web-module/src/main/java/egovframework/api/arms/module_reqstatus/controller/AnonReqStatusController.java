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
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.module_reqstatus.service.ReqStatus;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-anon/api/arms/reqStatus"})
public class AnonReqStatusController extends SHVAbstractController<ReqStatus, ReqStatusDTO> {

    @Autowired
    @Qualifier("reqStatus")
    private ReqStatus reqStatus;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqStatus);
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{reqStatusTableName}/updateStatusNode.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView putJiraIssue(
            @PathVariable(value ="reqStatusTableName") String reqStatusTableName,
            ModelMap model, HttpServletRequest request) throws Exception {

        SessionUtil.setAttribute("updateStatusNode",reqStatusTableName);
        reqStatus.putJiraIssue(reqStatusTableName);
        SessionUtil.removeAttribute("updateStatusNode");

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String armsUrl = "http://127.0.0.1:13131";
        String targetUrl = "/callback/api/arms/reqStatus/" + reqStatusTableName + "/issueCrawler/updateStatusNode.do";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(armsUrl + targetUrl, String.class);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "AnonReqStatusController :: putJiraIssue");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{reqStatusTableName}/reqIssueDisable/updateStatusNode.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView disableJiraIssue(
            @PathVariable(value ="reqStatusTableName") String reqStatusTableName,
            ModelMap model, HttpServletRequest request) throws Exception {

        SessionUtil.setAttribute("updateStatusNode",reqStatusTableName);
        reqStatus.disableJiraIssue(reqStatusTableName);
        SessionUtil.removeAttribute("updateStatusNode");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "AnonReqStatusController :: disableJiraIssue");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{reqStatusTableName}/issueCrawler/updateStatusNode.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView updateJiraIssueCrawler(
            @PathVariable(value ="reqStatusTableName") String reqStatusTableName,
            ModelMap model, HttpServletRequest request) throws Exception {

        SessionUtil.setAttribute("updateStatusNode",reqStatusTableName);
        reqStatus.updateJiraIssueCrawl(reqStatusTableName);
        SessionUtil.removeAttribute("updateStatusNode");
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", "AnonReqStatusController :: updateJiraIssueCrawler");
        return modelAndView;
    }

}
