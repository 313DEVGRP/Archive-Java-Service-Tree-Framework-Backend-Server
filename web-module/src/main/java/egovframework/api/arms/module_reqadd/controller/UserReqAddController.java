/*
 * @author Dongmin.lee
 * @since 2022-11-09
 * @version 22.11.09
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_reqadd.controller;

import egovframework.api.arms.module_reqadd.dao.ReqAddSqlMapperDao;
import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqadd.model.ReqAddSqlMaaperDTO;
import egovframework.api.arms.module_reqadd.service.ReqAdd;
import egovframework.api.arms.module_reqadd.service.ReqAddSqlMapper;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.springiBatis.core.service.CoreService;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqAdd"})
public class UserReqAddController extends SHVAbstractController<ReqAdd, ReqAddDTO> {

    @Autowired
    @Qualifier("reqAdd")
    private ReqAdd reqAdd;

    @Resource(name = "reqAddSqlMapper")
    ReqAddSqlMapper reqAddSqlMapper;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqAdd);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/getTest.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqAddSqlMaaperDTO> ModelAndView getTest(V reqAddSqlMaaperDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        logger.info("UserReqAddController :: getTest :: tableName = " + reqAddSqlMaaperDTO.getC_title());

        if(reqAddSqlMapper.isExistTable(reqAddSqlMaaperDTO) == 1){
            logger.error("already exist JSTF table : " + reqAddSqlMaaperDTO.getC_title());
        }else{
            reqAddSqlMapper.ddlExecuteToReqAdd(reqAddSqlMaaperDTO);
            reqAddSqlMapper.ddlSequenceExecuteToReqAdd(reqAddSqlMaaperDTO);
            reqAddSqlMapper.dmlExecuteToReqAdd(reqAddSqlMaaperDTO);
        }

        String C_title_org = reqAddSqlMaaperDTO.getC_title();
        reqAddSqlMaaperDTO.setC_title(reqAddSqlMaaperDTO.getC_title() + "_LOG");
        if(reqAddSqlMapper.isExistTable(reqAddSqlMaaperDTO) == 1){
            logger.error("already exist log table : " + reqAddSqlMaaperDTO.getC_title());
        }else{
            reqAddSqlMaaperDTO.setC_title(C_title_org);
            reqAddSqlMapper.ddlLogExecuteToReqAdd(reqAddSqlMaaperDTO);
            //reqAddSqlMapper.ddlTriggerLogSqlExecuteToReqAdd(reqAddSqlMaaperDTO);
        }

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "good");
        return modelAndView;
//        if (parser.getInt("c_id") <= 0) {
//            throw new RuntimeException();
//        } else {
//            SessionUtil.setAttribute("replaceTableName",reqAddDTO.getC_title());
//            V returnVO = this.reqAdd.getNode(reqAddDTO);
//            SessionUtil.removeAttribute("replaceTableName");
//            ModelAndView modelAndView = new ModelAndView("jsonView");
//            modelAndView.addObject("result", returnVO);
//            return modelAndView;
//        }
    }

}
