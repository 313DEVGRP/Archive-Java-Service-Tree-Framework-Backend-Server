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

import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.api.arms.module_filerepositorylog.model.FileRepositoryLogDTO;
import egovframework.api.arms.module_filerepositorylog.service.FileRepositoryLog;
import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_pdserviceconnect.service.PdServiceConnect;
import egovframework.api.arms.module_pdserviceconnectlog.service.PdServiceConnectLog;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.api.arms.module_pdservicejiralog.service.PdServiceJiraLog;
import egovframework.api.arms.module_pdservicejiraver.model.PdServiceJiraVerDTO;
import egovframework.api.arms.module_pdservicelog.service.PdServiceLog;
import egovframework.api.arms.module_pdserviceversionlog.service.PdServiceVersionLog;
import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqadd.service.ReqAdd;
import egovframework.api.arms.module_reqaddlog.model.ReqAddLogDTO;
import egovframework.api.arms.module_reqaddlog.service.ReqAddLog;
import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.module_reqstatus.service.ReqStatus;
import egovframework.api.arms.util.FileHandler;
import egovframework.api.arms.util.StringUtility;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.MoveNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.UpdateNode;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateLogDTO;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import egovframework.com.ext.jstree.support.util.StringUtils;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.ArrayUtils;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqAdd"})
public class UserReqAddController extends SHVAbstractController<ReqAdd, ReqAddDTO> {

    @Autowired
    @Qualifier("reqAdd")
    private ReqAdd reqAdd;

    @Autowired
    @Qualifier("fileRepository")
    private FileRepository fileRepository;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(reqAdd);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getMonitor(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            ReqAddDTO reqAddDTO, ModelMap model, HttpServletRequest request) throws Exception {

        SessionUtil.setAttribute("getMonitor",changeReqTableName);

        reqAddDTO.setOrder(Order.asc("c_left"));
        List<ReqAddDTO> list = this.reqAdd.getChildNode(reqAddDTO);

        SessionUtil.removeAttribute("getMonitor");

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getNode.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqAddDTO> ModelAndView getSwitchDBNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName
            ,V reqAddDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("getNode",changeReqTableName);

            V returnVO = reqAdd.getNode(reqAddDTO);
            if(StringUtils.isNotEmpty(returnVO.getC_version_link())) {
                String replaceTxt = returnVO.getC_version_link().replaceAll("\\[", "").replaceAll("\\]", "");
                replaceTxt = replaceTxt.replaceAll("\"", "");
                returnVO.setC_version_link(replaceTxt);
            }

            SessionUtil.removeAttribute("getNode");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnVO);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getChildNode.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqAddDTO> ModelAndView
        getSwitchDBChildNode(@PathVariable(value ="changeReqTableName") String changeReqTableName,
                             ReqAddDTO reqAddDTO, HttpServletRequest request) throws Exception {
        ParameterParser parser = new ParameterParser(request);
        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("getChildNode",changeReqTableName);

            reqAddDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
            List<ReqAddDTO> list = reqAdd.getChildNode(reqAddDTO);

            SessionUtil.removeAttribute("getChildNode");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", list);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getChildNodeWithParent.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView
    getSwitchDBChildNodeWithParent(@PathVariable(value ="changeReqTableName") String changeReqTableName,
                                   ReqAddDTO reqAddDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("getChildNodeWithParent",changeReqTableName);

            //쿼리
            Criterion criterion1 = Restrictions.ge("c_left", reqAddDTO.getC_left());
            Criterion criterion2 = Restrictions.and(Restrictions.le("c_right", reqAddDTO.getC_right()));
            reqAddDTO.getCriterions().add(criterion1);
            reqAddDTO.getCriterions().add(criterion2);
            reqAddDTO.setOrder(Order.asc("c_left"));
            reqAddDTO.setC_id(null);

            List<ReqAddDTO> list = reqAdd.getChildNode(reqAddDTO);
            SessionUtil.removeAttribute("getChildNodeWithParent");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", list);
            return modelAndView;
        }
    }

    @Autowired
    @Qualifier("pdServiceConnect")
    private PdServiceConnect pdServiceConnect;

    @Autowired
    @Qualifier("reqStatus")
    private ReqStatus reqStatus;

    @Autowired
    @Qualifier("pdServiceJira")
    private PdServiceJira pdServiceJira;

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/addNode.do"},
            method = {RequestMethod.POST}
    )
    public ModelAndView addSwitchDBNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            @Validated({AddNode.class}) ReqAddDTO reqAddDTO,
            BindingResult bindingResult, ModelMap model) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("addNode",changeReqTableName);

            ReqAddDTO returnNode = reqAdd.addNode(reqAddDTO);

            SessionUtil.removeAttribute("addNode");

            // REQ-STATUS
            String verStr = returnNode.getC_version_link();
            verStr = StringUtils.remove(verStr, "\"");
            verStr = StringUtils.remove(verStr, "]");
            verStr = StringUtils.remove(verStr, "[");

            String[] verStrArr = StringUtils.split(verStr, ",");

            logger.info("verStrArr = " + verStrArr);

            if(verStrArr.length == 0){
                // 버전 스트링이 없다는건.
                // 개별 jira-version 을 개별로 선택하겠다는 것.
                ReqStatusDTO reqStatusDTO = new ReqStatusDTO();
                reqStatusDTO.setRef(2L);
                reqStatusDTO.setC_type("default");
                reqStatusDTO.setC_pdservice_link(
                        StringUtility.toLong(StringUtility.remove(changeReqTableName,"T_ARMS_REQADD_")));
                reqStatusDTO.setC_version_link("independent");
                reqStatusDTO.setC_jira_link(""); //pdservicejiraver 링크 정보 :: 향후 업데이트 하게 두자
                reqStatusDTO.setC_req_link(returnNode.getC_id().toString());
                reqStatusDTO.setC_jira_version_link(""); //당연히 처음엔 없겠지.

                ReqStatusDTO updater = reqStatus.addNode(reqStatusDTO);

                SessionUtil.setAttribute("addNode",changeReqTableName);

                //returnNode.setC_issue_link(updater.getC_id().toString());
                reqAdd.updateNode(returnNode);

                SessionUtil.removeAttribute("addNode");


            }else{
                // 버전 스트링이 있다는건.
                // 정규 표현으로 제품(서비스)-버전-JIRA 프로젝트 셋팅을 따라가겠다는 것.
                for ( String ver : verStrArr){

                    //설정한 버전의 지라 정보를 가져와야 하고
                    PdServiceConnectDTO pdServiceConnectDTO = new PdServiceConnectDTO();
                    pdServiceConnectDTO.setWhere("c_pdservice_id", StringUtility.remove(changeReqTableName,"T_ARMS_REQADD_"));
                    pdServiceConnectDTO.setWhere("c_pdservice_version_id", ver);
                    PdServiceConnectDTO connectInfo = pdServiceConnect.getNode(pdServiceConnectDTO);

                    String jiraIds = connectInfo.getC_pdservice_jira_ids();
                    jiraIds = StringUtils.remove(jiraIds, "\"");
                    jiraIds = StringUtils.remove(jiraIds, "]");
                    jiraIds = StringUtils.remove(jiraIds, "[");

                    String[] jiraIdsArr = StringUtils.split(jiraIds, ",");

                    List<String> reqStatusIDs = new ArrayList<>();
                    for ( String jiraId : jiraIdsArr ){

                        //지라 아이디를 가져왔으니
                        PdServiceJiraDTO pdServiceJiraDTO = new PdServiceJiraDTO();
                        pdServiceJiraDTO.setC_id(StringUtility.toLong(jiraId));
                        PdServiceJiraDTO jiraInfo = pdServiceJira.getNode(pdServiceJiraDTO);

                        //지라 버전 정보를 가져오자
                        PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                        pdServiceJiraVerDTO.setWhere("c_pdservice_id", StringUtility.remove(changeReqTableName,"T_ARMS_REQADD_"));
                        pdServiceJiraVerDTO.setWhere("c_pdservice_version_id", ver);
                        pdServiceJiraVerDTO.setWhere("c_pdservice_jira_id", jiraId);
                        PdServiceJiraVerDTO jiraVerInfo = pdServiceConnect.getNode(pdServiceJiraVerDTO);

                        ReqStatusDTO reqStatusDTO = new ReqStatusDTO();
                        reqStatusDTO.setRef(2L);
                        reqStatusDTO.setC_type("default");
                        reqStatusDTO.setC_pdservice_link(
                                StringUtility.toLong(StringUtility.remove(changeReqTableName,"T_ARMS_REQADD_")));
                        reqStatusDTO.setC_version_link(ver);
                        reqStatusDTO.setC_jira_link(jiraInfo.getC_jira_link()); //pdservicejiraver 링크 정보 :: 향후 업데이트 하게 두자
                        reqStatusDTO.setC_jira_version_link(jiraVerInfo.getC_jiraversion_link());
                        reqStatusDTO.setC_req_link(returnNode.getC_id().toString());

                        ReqStatusDTO updater = reqStatus.addNode(reqStatusDTO);
                        reqStatusIDs.add(updater.getC_id().toString());
                    }

                    SessionUtil.setAttribute("addNode",changeReqTableName);

                    //returnNode.setC_issue_link(reqStatusIDs.stream()
                    //        .collect(Collectors.joining(",")));
                    reqAdd.updateNode(returnNode);

                    SessionUtil.removeAttribute("addNode");

                }
            }



            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnNode);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping({"/{changeReqTableName}/updateNode.do"})
    public ModelAndView updateNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            @Validated({UpdateNode.class}) ReqAddDTO reqAddDTO,
            BindingResult bindingResult, HttpServletRequest request, ModelMap model) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        } else {
            SessionUtil.setAttribute("updateNode",changeReqTableName);

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", reqAdd.updateNode(reqAddDTO));

            SessionUtil.removeAttribute("updateNode");

//            ReqStatusDTO checkReqStatusDTO = new ReqStatusDTO();
//            checkReqStatusDTO.setWhere("c_pdservice_link", StringUtility.toLong(changeReqTableName));
//            checkReqStatusDTO.setWhere("c_version_link", "independent");
//            checkReqStatusDTO.setWhere("c_jira_link", returnNode.getC_jira_link());
//            checkReqStatusDTO.setWhere("c_req_link", returnNode.getC_id().toString());
//            ReqStatusDTO checkReturn = reqStatus.getNode(checkReqStatusDTO);
//
//            if(checkReturn == null){
//                //db에 없으니까.
//            }else{
//                //db에 있다고????
//            }

            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/moveNode.do"},
            method = {RequestMethod.POST}
    )
    public ModelAndView moveSwitchDBNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            @Validated({MoveNode.class}) ReqAddDTO reqAddDTO,
            BindingResult bindingResult, ModelMap model, HttpServletRequest request) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("moveNode",changeReqTableName);

            this.reqAdd.moveNode(reqAddDTO, request);
            super.setJsonDefaultSetting(reqAddDTO);

            SessionUtil.removeAttribute("moveNode");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", reqAddDTO);
            return modelAndView;
        }
    }

    /**
     * 이미지 Upload를 처리한다.
     *
     * @param multiRequest
     * @param model
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value="/uploadFileToNode.do")
    public ModelAndView uploadFileToNode(final MultipartHttpServletRequest multiRequest,
        HttpServletRequest request, Model model) throws Exception {

        ParameterParser parser = new ParameterParser(request);
        long fileIdLink = parser.getLong("fileIdLink");
        String c_title = parser.get("c_title");

        HashMap<String, List<EgovFormBasedFileVo>> map = FileHandler.upload(multiRequest, fileIdLink, c_title, fileRepository, logger);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", map);

        return modelAndView;
    }

    @Autowired
    @Qualifier("fileRepositoryLog")
    private FileRepositoryLog fileRepositoryLog;

    @Autowired
    @Qualifier("pdServiceConnectLog")
    private PdServiceConnectLog pdServiceConnectLog;

    @Autowired
    @Qualifier("pdServiceJiraLog")
    private PdServiceJiraLog pdServiceJiraLog;

    @Autowired
    @Qualifier("pdServiceVersionLog")
    private PdServiceVersionLog pdServiceVersionLog;

    @Autowired
    @Qualifier("pdServiceLog")
    private PdServiceLog pdServiceLog;

    @Autowired
    @Qualifier("reqAddLog")
    private ReqAddLog reqAddLog;


    @ResponseBody
    @RequestMapping(
            value = {"/{changeReqTableName}/getHistory.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getHistory(
            @PathVariable(value ="changeReqTableName") String changeReqTableName,
            ModelMap model, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        // 문자열
        String startDateStr = parser.get("startDate");
        // 포맷터
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        // 문자열 -> Date
        Date startDate = formatter.parse(startDateStr);

        Timestamp startTimestamp = new Timestamp(startDate.getTime());

        // 문자열
        String endDateStr = parser.get("endDate");
        // 문자열 -> Date
        Date endDate = formatter.parse(endDateStr);

        Timestamp endTimestamp = new Timestamp(endDate.getTime());


        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );

        FileRepositoryLogDTO fileRepositoryLogDTO = new FileRepositoryLogDTO();
        fileRepositoryLogDTO.setWhereBetween("c_date", startDate, endDate);
        //fileRepositoryLogDTO.setOrder(Order.desc("c_date"));
        fileRepositoryLogDTO.setWhere("c_title", changeReqTableName);
        //fileRepositoryLogDTO.setWhere("fileIdLink", parser.getLong("fileIdLink"));
        fileRepositoryLogDTO.getCriterions().add(criterion);
        List<FileRepositoryLogDTO> fileRepositoryLogList = fileRepositoryLog.getChildNode(fileRepositoryLogDTO);

//        PdServiceConnectLogDTO pdServiceConnectLogDTO = new PdServiceConnectLogDTO();
//        pdServiceConnectLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
//        pdServiceConnectLogDTO.setOrder(Order.asc("c_left"));
//        pdServiceConnectLogDTO.setWhere("c_pdservice_id", parser.get("c_id"));
//        pdServiceConnectLogDTO.getCriterions().add(criterion);
//        List<PdServiceConnectLogDTO> pdServiceConnectLogDTOList = this.pdServiceConnectLog.getChildNode(pdServiceConnectLogDTO);
//
//        PdServiceVersionLogDTO pdServiceVersionLogDTO = new PdServiceVersionLogDTO();
//        pdServiceVersionLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
//        pdServiceVersionLogDTO.setOrder(Order.asc("c_left"));
//        pdServiceVersionLogDTO.setWhere("c_pdservice_link", parser.get("c_id"));
//        pdServiceVersionLogDTO.getCriterions().add(criterion);
//        List<PdServiceVersionLogDTO> pdServiceVersionLogDTOList = this.pdServiceVersionLog.getChildNode(pdServiceVersionLogDTO);
//
//        PdServiceLogDTO pdServiceLogDTO = new PdServiceLogDTO();
//        pdServiceLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
//        pdServiceLogDTO.setOrder(Order.asc("c_left"));
//        pdServiceLogDTO.setWhere("c_id", parser.getLong("c_id"));
//        pdServiceLogDTO.getCriterions().add(criterion);
//        List<PdServiceLogDTO> pdServiceLogDTOList = this.pdServiceLog.getChildNode(pdServiceLogDTO);

        SessionUtil.setAttribute("getHistory",changeReqTableName);
        ReqAddLogDTO reqAddLogDTO = new ReqAddLogDTO();
        reqAddLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
        //reqAddLogDTO.setOrder(Order.desc("c_date"));
        reqAddLogDTO.getCriterions().add(criterion);
        List<ReqAddLogDTO> reqAddLogDTOList = this.reqAddLog.getChildNode(reqAddLogDTO);
        SessionUtil.removeAttribute("getHistory");

        List<JsTreeHibernateLogDTO> mergeList = new ArrayList<>();
        mergeList.addAll(fileRepositoryLogList);
//        mergeList.addAll(pdServiceLogDTOList);
//        mergeList.addAll(pdServiceConnectLogDTOList);
//        mergeList.addAll(pdServiceVersionLogDTOList);
        mergeList.addAll(reqAddLogDTOList);

        List<JsTreeHibernateLogDTO> ascTD = mergeList.stream() // Sort Order By asc - Comparator의 comparing 사용, ::를 활용한 참조 방식 사용, stream을 활용한 List의 sorted사용 및 collect를 활용한 Collectors.toList() 사용
                .sorted(Comparator.comparing(JsTreeHibernateLogDTO::getC_date).reversed())
                .collect(Collectors.toList());

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", ascTD);
        return modelAndView;
    }

}
