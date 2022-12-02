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
import egovframework.api.arms.module_armsmaker.model.ArmsMakerDTO;
import egovframework.api.arms.module_armsmaker.service.ArmsInstallDB;
import egovframework.api.arms.module_armsmaker.service.ArmsMaker;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
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
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/armsMaker"})
public class UserArmsMakerController extends SHVAbstractController<ArmsMaker, ArmsMakerDTO> {

    @Autowired
    @Qualifier("armsMaker")
    private ArmsMaker armsMaker;

    @Resource(name = "fileRepositoryInstallDBImpl")
    ArmsInstallDB fileRepositoryInstallDBImpl;

    @Resource(name = "pdServiceInstallDB")
    ArmsInstallDB pdServiceInstallDB;

    @Resource(name = "pdServiceVersionInstallDB")
    ArmsInstallDB pdServiceVersionInstallDB;

    @Resource(name = "pdServiceConnectInstallDB")
    ArmsInstallDB pdServiceConnectInstallDB;

    @Resource(name = "pdServiceJiraInstallDB")
    ArmsInstallDB pdServiceJiraInstallDB;

    @Resource(name = "pdServiceJiraVersionInstallDB")
    ArmsInstallDB pdServiceJiraVersionInstallDB;

    @Resource(name = "reqAddTemplateInstallDB")
    ArmsInstallDB reqAddTemplateInstallDB;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(armsMaker);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = {"/module_filerepository.do"},method = {RequestMethod.GET})
    public ModelAndView module_filerepository(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_fileRepository :: tableName = T_ARMS_FILEREPOSITORY");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-fileRepository");
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_FILEREPOSITORY");
        fileRepositoryInstallDBImpl.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_filerepository");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdservice.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdservice(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdservice :: tableName = T_ARMS_PDSERVICE");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_PDSERVICE");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-pdservice");
        pdServiceInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdservice");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdserviceversion.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdserviceversion(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdserviceversion :: tableName = T_ARMS_PDSERVICEVERSION");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_PDSERVICEVERSION");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-pdserviceversion");
        pdServiceVersionInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdserviceversion");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdserviceconnect.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdserviceconnect(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdserviceconnect :: tableName = T_ARMS_PDSERVICECONNECT");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_PDSERVICECONNECT");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-pdserviceconnect");
        pdServiceConnectInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdserviceconnect");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdservicejira.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdservicejira(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdservicejira :: tableName = T_ARMS_PDSERVICEJIRA");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_PDSERVICEJIRA");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-pdservicejira");
        pdServiceJiraInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdservicejira");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_pdservicejiraver.do"},method = {RequestMethod.GET})
    public ModelAndView module_pdservicejiraver(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_pdservicejira :: tableName = T_ARMS_PDSERVICEJIRAVER");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_PDSERVICEJIRAVER");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-pdservicejiraver");
        pdServiceJiraVersionInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_pdservicejiraver");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = {"/module_reqadd.do"},method = {RequestMethod.GET})
    public ModelAndView module_reqadd(
            ComprehensiveTree comprehensiveTree, ModelMap model, HttpServletRequest request) throws Exception {

        logger.info("UserArmsMakerController :: module_reqadd :: tableName = T_ARMS_REQADD");

        ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
        armsInstallDB_sqlMaaperDTO.setC_title("T_ARMS_REQADD");
        armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-reqadd-template");
        reqAddTemplateInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "module_reqadd");
        return modelAndView;
    }

}
