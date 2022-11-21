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
package egovframework.api.arms.module_armsmaker.controller;

import egovframework.api.arms.module_armsmaker.model.ArmsInstallDB_SqlMaaperDTO;
import egovframework.api.arms.module_armsmaker.service.ArmsInstallDB;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_reqadd.model.ReqAddSqlMaaperDTO;
import egovframework.api.arms.module_reqadd.service.ReqAddSqlMapper;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springiBatis.core.service.SupportService;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_armsmaker.model.ArmsMakerDTO;
import egovframework.api.arms.module_armsmaker.service.ArmsMaker;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/armsMaker"})
public class UserArmsMakerController extends SHVAbstractController<ArmsMaker, ArmsMakerDTO> {

    @Autowired
    @Qualifier("armsMaker")
    private ArmsMaker armsMaker;

    @Resource(name = "pdServiceInstallDB")
    ArmsInstallDB pdServiceInstallDB;

    @Resource(name = "pdServiceVersionInstallDB")
    ArmsInstallDB pdServiceVersionInstallDB;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(armsMaker);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = {"/module_filerepository.do"},method = {RequestMethod.GET})
    public ModelAndView module_filerepository(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_fileRepository :: tableName = PDSERVICE");

        pdServiceInstallDB.sqlMapExecute();

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_filerepository");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdservice.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdservice(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdservice :: tableName = PDSERVICE");

        pdServiceInstallDB.sqlMapExecute();

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdservice");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdserviceversion.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdserviceversion(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdserviceversion :: tableName = PDSERVICEVERSION");

        pdServiceVersionInstallDB.sqlMapExecute();

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdservice");
        return modelAndView;
    }



}
