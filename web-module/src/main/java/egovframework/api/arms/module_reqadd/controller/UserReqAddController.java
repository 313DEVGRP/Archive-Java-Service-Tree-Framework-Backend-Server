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
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;
import egovframework.api.arms.module_pdserviceconnect.model.PdServiceConnectDTO;
import egovframework.api.arms.module_pdserviceconnect.service.PdServiceConnect;
import egovframework.api.arms.module_pdserviceconnectlog.service.PdServiceConnectLog;
import egovframework.api.arms.module_pdservicejira.model.PdServiceJiraDTO;
import egovframework.api.arms.module_pdservicejira.service.PdServiceJira;
import egovframework.api.arms.module_pdservicejiralog.service.PdServiceJiraLog;
import egovframework.api.arms.module_pdservicejiraver.model.PdServiceJiraVerDTO;
import egovframework.api.arms.module_pdservicejiraver.service.PdServiceJiraVer;
import egovframework.api.arms.module_pdservicelog.service.PdServiceLog;
import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.api.arms.module_pdserviceversion.service.PdServiceVersion;
import egovframework.api.arms.module_pdserviceversionlog.service.PdServiceVersionLog;
import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqadd.service.ReqAdd;
import egovframework.api.arms.module_reqaddlog.model.ReqAddLogDTO;
import egovframework.api.arms.module_reqaddlog.service.ReqAddLog;
import egovframework.api.arms.module_reqreview.model.ReqReviewDTO;
import egovframework.api.arms.module_reqreview.service.ReqReview;
import egovframework.api.arms.module_reqstatus.model.ReqStatusDTO;
import egovframework.api.arms.module_reqstatus.service.ReqStatus;
import egovframework.api.arms.util.FileHandler;
import egovframework.api.arms.util.PropertiesReader;
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
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
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
            value = {"/{changeReqTableName}/getJiraVersion/getNode.do"},
            method = {RequestMethod.GET}
    )
    public <V extends ReqAddDTO> ModelAndView getJiraVersionListByNode(
            @PathVariable(value ="changeReqTableName") String changeReqTableName
            ,V reqAddDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        if (parser.getInt("c_id") <= 0) {
            throw new RuntimeException();
        } else {

            SessionUtil.setAttribute("getNode",changeReqTableName);

            //1. 노드를 가져와서.
            //
            V returnVO = reqAdd.getNode(reqAddDTO);
//            if(StringUtils.isNotEmpty(returnVO.getC_version_link())) {
//                String replaceTxt = returnVO.getC_version_link().replaceAll("\\[", "").replaceAll("\\]", "");
//                replaceTxt = replaceTxt.replaceAll("\"", "");
//                returnVO.setC_version_link(replaceTxt);
//            }

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

    @Autowired
    @Qualifier("pdService")
    private PdService pdService;

    @Autowired
    @Qualifier("pdServiceVersion")
    private PdServiceVersion pdServiceVersion;

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

            Long pdServiceInfo = returnNode.getC_pdservice_link();
            String versionInfo = returnNode.getC_version_link(); // 버전 정보
            String[] versionInfoArr = jsonStringifyConvert(versionInfo);

            String jiraInfo = returnNode.getC_jira_link(); //버전 정보가 있으면, JIRA 링크는 무조건 inherit 이다.
            String jiraVerInfo = returnNode.getC_jira_ver_link(); // 버전 정보가 없다면, 개별 처리이다.

            List<String> updateReqStatusIDs = new ArrayList<>(); //최종 C_ISSUE_LINK 업데이트 목적
            List<String> updateJiraVerIDs = new ArrayList<>(); //최종 C_JIRA_VER_LINK 업데이트 목적

            if(versionInfoArr.length == 0){
                //버전 정보가 없다는 뜻. -> 개별 처리를 하겠다는 뜻.

                returnNode.setC_version_link("[]");
                returnNode.setC_jira_link("independent");

                SessionUtil.setAttribute("addNode",changeReqTableName);

                reqAdd.updateNode(returnNode);

                SessionUtil.removeAttribute("addNode");

            }else{
                //버전 정보가 있다는 뜻. -> 버전 - JIRA 연결 정보를 기반으로 처리하겠다는 뜻.

                PdServiceDTO pdServiceDTO = new PdServiceDTO();
                pdServiceDTO.setWhere("c_id", pdServiceInfo);
                PdServiceDTO pdServiceDTOInfo = pdService.getNode(pdServiceDTO);


                for ( String verStr : versionInfoArr ) {

                    PdServiceVersionDTO pdServiceVersionDTO = new PdServiceVersionDTO();
                    pdServiceVersionDTO.setWhere("c_id", StringUtility.toLong(verStr));
                    PdServiceVersionDTO versionDTO = pdServiceVersion.getNode(pdServiceVersionDTO);


                    PdServiceConnectDTO pdServiceConnectDTO = new PdServiceConnectDTO();
                    pdServiceConnectDTO.setWhere("c_pdservice_id", pdServiceInfo.toString());
                    pdServiceConnectDTO.setWhere("c_pdservice_version_id", verStr);
                    PdServiceConnectDTO connectInfo = pdServiceConnect.getNode(pdServiceConnectDTO);

                    //중첩 IF - LOOP
                    if(connectInfo == null){
                        //이건 말이 안되지만, 설정 정보가 없어버리면... 어떻게 해야 하지?
                        //개별 정보로 빼자.

                        returnNode.setC_jira_link("independent");

                        SessionUtil.setAttribute("addNode",changeReqTableName);

                        reqAdd.updateNode(returnNode);

                        SessionUtil.removeAttribute("addNode");

                    }else{

                        String jiraIDs = connectInfo.getC_pdservice_jira_ids();
                        String[] jiraIDsArr = jsonStringifyConvert(jiraIDs);

                        //설정된 JIRA ID가 있다면.
                        for ( String jiraID: jiraIDsArr ) {
                            PdServiceJiraDTO pdServiceJiraDTO = new PdServiceJiraDTO();
                            pdServiceJiraDTO.setC_id(StringUtility.toLong(jiraID));
                            PdServiceJiraDTO jiraDTOInfo = pdServiceJira.getNode(pdServiceJiraDTO);

                            //pdservice ID 값
                            //pdservice verstion 값
                            //pdservice jira 값

                            PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                            pdServiceJiraVerDTO.setWhere("c_pdservice_id", pdServiceInfo);
                            pdServiceJiraVerDTO.setWhere("c_pdservice_version_id", StringUtility.toLong(verStr));
                            pdServiceJiraVerDTO.setWhere("c_pdservice_jira_id",StringUtility.toLong(jiraID));
                            PdServiceJiraVerDTO jiraVerDTOInfo = pdServiceJira.getNode(pdServiceJiraVerDTO);

                            if( jiraVerDTOInfo == null ){
                                //없다는 건.? -
                                //여기까지 왔다는건. 커넥션 정보는 있지만,
                                //Jira Project - Jira Version 이 생성되지 않았다는 건데.
                                //버전 생성 시 바로 resttemplate 로 jira version sync를 맞추기 때문에
                                //여기로 들어올 수는 없다.
                                throw new RuntimeException("커넥션 정보는 있지만, JIRA Version 이 생성이 안된 케이스.");
                            }else{
                                //있다는건. 매우 정상
                                ReqStatusDTO reqStatusDTO = new ReqStatusDTO();

                                reqStatusDTO.setRef(2L);
                                reqStatusDTO.setC_type("default");
                                reqStatusDTO.setC_title("enable");

                                reqStatusDTO.setC_pdservice_link(pdServiceInfo);
                                reqStatusDTO.setC_pdservice_name(pdServiceDTOInfo.getC_title());

                                reqStatusDTO.setC_version_link(StringUtility.toLong(verStr));
                                reqStatusDTO.setC_version_name(versionDTO.getC_title());

                                reqStatusDTO.setC_jira_project_link(jiraDTOInfo.getC_id());
                                reqStatusDTO.setC_jira_project_name(jiraDTOInfo.getC_jira_name());
                                reqStatusDTO.setC_jira_project_key(jiraDTOInfo.getC_jira_key());
                                reqStatusDTO.setC_jira_project_url(jiraDTOInfo.getC_jira_link());

                                reqStatusDTO.setC_jira_version_link(jiraVerDTOInfo.getC_id());
                                reqStatusDTO.setC_jira_version_name(jiraVerDTOInfo.getC_jiraversion_name());
                                reqStatusDTO.setC_jira_version_url(jiraVerDTOInfo.getC_jiraversion_link());
                                reqStatusDTO.setC_jira_version_title(jiraVerDTOInfo.getC_title());

                                //REQADD 의 요구사항 아이디, 타이틀
                                reqStatusDTO.setC_req_link(returnNode.getC_id());
                                reqStatusDTO.setC_req_name(returnNode.getC_title());


                                String changeReqStatusTableName = changeReqTableName;
                                //T_ARMS_REQADD_145 -> T_ARMS_REQSTATUS_145
                                changeReqStatusTableName = StringUtility.replace(changeReqStatusTableName,
                                        "T_ARMS_REQADD_", "T_ARMS_REQSTATUS_");
                                SessionUtil.setAttribute("addNode",changeReqStatusTableName);

                                ReqStatusDTO statusDTO = reqStatus.addNode(reqStatusDTO);
                                updateReqStatusIDs.add(statusDTO.getC_id().toString());
                                updateJiraVerIDs.add(jiraVerDTOInfo.getC_id().toString());
                                SessionUtil.removeAttribute("addNode");

                            }

                        }

                    }
                }

            }

            String issueLinkResult = updateReqStatusIDs.stream().collect(Collectors.joining(","));
            String jiraVerResult = updateJiraVerIDs.stream().collect(Collectors.joining(","));
            returnNode.setC_issue_link(issueLinkResult);
            returnNode.setC_jira_ver_link(jiraVerResult);

            SessionUtil.setAttribute("addNode",changeReqTableName);

            reqAdd.updateNode(returnNode);

            SessionUtil.removeAttribute("addNode");
            // REQADD-STATUS
            // 1. 테이블 네임을 T_ARMS_REQADD_145 -> T_ARMS_REQADD_STATUS_145 로 변경하고
            // 2. returnNode의 Version Data 가 있으면, 정형적인 케이스니까 처리해 주고
            // 3. returnNode의 Version Data 가 없으면, 이건 따로 지정하겠다는 뜻이니까 처리해 주고
            // 4. JIRA 연결해서 데이터 셋팅 해 주고 . 끝

            // REQADD
            // 마지막으로 , REQADD_STATUS에 이슈 추가 했으면,
            // REQADD 테이블에 C_ISSUE_LINK 에 ARR String 으로 값 추가해 줄것.

            String reviewer01 = returnNode.getC_reviewer01();
            reqReviewAddNode(returnNode, pdServiceInfo, reviewer01);

            String reviewer02 = returnNode.getC_reviewer02();
            reqReviewAddNode(returnNode, pdServiceInfo, reviewer02);

            String reviewer03 = returnNode.getC_reviewer03();
            reqReviewAddNode(returnNode, pdServiceInfo, reviewer03);

            String reviewer04 = returnNode.getC_reviewer04();
            reqReviewAddNode(returnNode, pdServiceInfo, reviewer04);

            String reviewer05 = returnNode.getC_reviewer05();
            reqReviewAddNode(returnNode, pdServiceInfo, reviewer05);

            String reqTableName = StringUtility.replace(changeReqTableName,
                    "T_ARMS_REQADD_", "T_ARMS_REQSTATUS_");

            PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
            String armsUrl = "http://127.0.0.1:13131";
            String targetUrl = "/callback/api/arms/reqStatus/" + reqTableName + "/updateStatusNode.do";

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.getForEntity(armsUrl + targetUrl, String.class);
            logger.info("response = " + response);

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnNode);
            return modelAndView;
        }
    }

    public void reqReviewDataClean(ReqAddDTO returnNode, Long pdServiceInfo, String reviewer01, String reviewer02, String reviewer03, String reviewer04, String reviewer05) throws Exception {

        ReqReviewDTO searchReqReviewDTO = new ReqReviewDTO();
        searchReqReviewDTO.setWhere("c_review_pdservice_link", pdServiceInfo);
        searchReqReviewDTO.setWhere("c_review_req_link", returnNode.getC_id());
        List<ReqReviewDTO> searchList = reqReview.getChildNode(searchReqReviewDTO);
        for ( ReqReviewDTO reqReviewDTO : searchList ) {
            if( StringUtility.equals(reqReviewDTO.getC_review_responder() , reviewer01) ||
                    StringUtility.equals(reqReviewDTO.getC_review_responder() , reviewer02) ||
                    StringUtility.equals(reqReviewDTO.getC_review_responder() , reviewer03) ||
                    StringUtility.equals(reqReviewDTO.getC_review_responder() , reviewer04) ||
                    StringUtility.equals(reqReviewDTO.getC_review_responder() , reviewer05) ){
                logger.info("reqReviewDataClean hit = " + reqReviewDTO.getC_review_responder());

                if( StringUtility.contains(reqReviewDTO.getC_review_result_state(), "Disable" )){
                    reqReviewDTO.setC_review_result_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    reqReviewDTO.setC_review_result_state("Update-Enable");
                    reqReview.updateNode(reqReviewDTO);
                }

            }else{
                reqReviewDTO.setC_review_result_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                reqReviewDTO.setC_review_result_state("Update-Disable");
                reqReview.updateNode(reqReviewDTO);
            }
        }

    }

    public void reqReviewAddNode(ReqAddDTO returnNode, Long pdServiceInfo, String reviewer) throws Exception {
        if (StringUtility.equals(reviewer, "none")) {
            logger.info("reviewer01 is none");
        } else {

            PdServiceDTO pdServiceDTO = new PdServiceDTO();
            pdServiceDTO.setC_id(pdServiceInfo);
            PdServiceDTO pdServiceCheckInfo = pdService.getNode(pdServiceDTO);

            ReqReviewDTO searchReqReviewDTO = new ReqReviewDTO();
            searchReqReviewDTO.setWhere("c_review_pdservice_link", pdServiceInfo);
            searchReqReviewDTO.setWhere("c_review_req_link", returnNode.getC_id());
            searchReqReviewDTO.setWhere("c_review_sender", returnNode.getC_writer());
            searchReqReviewDTO.setWhere("c_review_responder", reviewer);
            ReqReviewDTO searchResult = reqReview.getNode(searchReqReviewDTO);

            if( searchResult == null ){
                ReqReviewDTO reqReviewDTO = new ReqReviewDTO();
                reqReviewDTO.setRef(2L);
                reqReviewDTO.setC_type("default");
                reqReviewDTO.setC_review_pdservice_link(pdServiceInfo);
                reqReviewDTO.setC_review_pdservice_name(pdServiceCheckInfo.getC_title());

                reqReviewDTO.setC_review_version_link(returnNode.getC_version_link());

                reqReviewDTO.setC_review_jira_link(returnNode.getC_jira_link());

                reqReviewDTO.setC_review_jira_ver_link(returnNode.getC_jira_ver_link());

                reqReviewDTO.setC_review_req_link(returnNode.getC_id());
                reqReviewDTO.setC_review_req_name(returnNode.getC_title());

                reqReviewDTO.setC_review_sender(returnNode.getC_writer());
                reqReviewDTO.setC_review_responder(reviewer);
                reqReviewDTO.setC_review_result_state("Enable");
                reqReviewDTO.setC_review_creat_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

                reqReview.addNode(reqReviewDTO);
            } else {
                searchResult.setC_review_pdservice_name(pdServiceCheckInfo.getC_title());

                searchResult.setC_review_version_link(returnNode.getC_version_link());

                searchResult.setC_review_jira_link(returnNode.getC_jira_link());

                searchResult.setC_review_jira_ver_link(returnNode.getC_jira_ver_link());

                searchResult.setC_review_req_name(returnNode.getC_title());

                searchResult.setC_review_result_state("Update-Enable");
                searchResult.setC_review_creat_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                reqReview.updateNode(searchResult);

            }

        }
    }

    @Autowired
    @Qualifier("reqReview")
    private ReqReview reqReview;

    public String[] jsonStringifyConvert(String versionInfo) {
        versionInfo = StringUtils.remove(versionInfo, "\"");
        versionInfo = StringUtils.remove(versionInfo, "]");
        versionInfo = StringUtils.remove(versionInfo, "[");
        return StringUtils.split(versionInfo, ",");
    }

    @Autowired
    @Qualifier("pdServiceJiraVer")
    private PdServiceJiraVer pdServiceJiraVer;

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

            reqAdd.updateNode(reqAddDTO);
            ReqAddDTO addDTO = reqAdd.getNode(reqAddDTO);

            SessionUtil.removeAttribute("updateNode");

            String versionInfo = addDTO.getC_version_link(); // 버전 정보
            String[] versionInfoArr = jsonStringifyConvert(versionInfo);

            String jiraVerInfo = addDTO.getC_jira_ver_link(); // 지라 버전 정보
            String[] jiraVerInfoArr = jsonStringifyConvert(jiraVerInfo);

            String issueInfo = addDTO.getC_issue_link(); //이미 등록된 이슈가 있는지
            String[] issueInfoArr = jsonStringifyConvert(issueInfo);

            List<String> updateReqStatusIDs = new ArrayList<>(); //최종 C_ISSUE_LINK 업데이트 목적
            List<String> updateJiraVerIDs = new ArrayList<>(); //최종 C_JIRA_VER_LINK 업데이트 목적

            if(versionInfoArr.length == 0){
                //버전 정보가 없다는 뜻.
                //이건 개별 처리에 대한 업데이트 니까.

                //곧바로, jiraVersion 정보를 가져와서 조회하고
                //그대로 업데이트 하면 된다.
                if(jiraVerInfoArr == null || jiraVerInfoArr.length == 0) {
                    //버전 정보도 없고, 지라 버전 정보도 없이 업데이트를 치는 경우
                    //이슈가 있으면 전부 disable 처리 할 것.
                    if(issueInfoArr.length == 0){
                        //버전 정보도 없고, 지라 버전 정보도 없이 업데이트를 치는 경우
                        //근데 이슈도 없어. - 할게 없네
                    }else{
                        for ( String issueID : issueInfoArr ) {
                            ReqStatusDTO reqStatusDTO = new ReqStatusDTO();
                            reqStatusDTO.setC_id(StringUtility.toLong(issueID));
                            reqStatusDTO.setC_title("disable");
                            SessionUtil.setAttribute("updateNode",changeReqTableName);

                            reqStatus.updateNode(reqStatusDTO);
                            SessionUtil.removeAttribute("updateNode");
                        }
                    }

                }else{
                    //버전 정보가 없는데, 지라 버전 정보는 있다는 건. 개별 처리를 한다는 거고
                    //이슈가 없으니까, 지라 버전만큼 이슈를 생성하자.
                    if(issueInfoArr.length == 0){
                        for ( String jiraVerID : jiraVerInfoArr ) {

                            PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                            pdServiceJiraVerDTO.setC_id(StringUtility.toLong(jiraVerID));
                            PdServiceJiraVerDTO jiraVerDTO = pdServiceJiraVer.getNode(pdServiceJiraVerDTO);

                            ReqStatusDTO reqStatusDTO = new ReqStatusDTO();

                            reqStatusDTO.setRef(2L);
                            reqStatusDTO.setC_type("default");
                            reqStatusDTO.setC_title("enable");

                            reqStatusDTO.setC_pdservice_link(jiraVerDTO.getC_pdservice_id());
                            reqStatusDTO.setC_pdservice_name(jiraVerDTO.getC_pdservice_name());

                            reqStatusDTO.setC_version_link(jiraVerDTO.getC_pdservice_version_id());
                            reqStatusDTO.setC_version_name(jiraVerDTO.getC_pdservice_version_name());

                            reqStatusDTO.setC_jira_project_link(jiraVerDTO.getC_pdservice_jira_id());
                            reqStatusDTO.setC_jira_project_name(jiraVerDTO.getC_pdservice_jira_name());
                            reqStatusDTO.setC_jira_project_key(jiraVerDTO.getC_pdservice_jira_key());
                            reqStatusDTO.setC_jira_project_url(jiraVerDTO.getC_pdservice_jira_link());

                            reqStatusDTO.setC_jira_version_link(jiraVerDTO.getC_id());
                            reqStatusDTO.setC_jira_version_name(jiraVerDTO.getC_jiraversion_name());
                            reqStatusDTO.setC_jira_version_url(jiraVerDTO.getC_jiraversion_link());
                            reqStatusDTO.setC_jira_version_title(jiraVerDTO.getC_title());

                            //REQADD 의 요구사항 아이디, 타이틀
                            reqStatusDTO.setC_req_link(addDTO.getC_id());
                            reqStatusDTO.setC_req_name(addDTO.getC_title());


                            String changeReqStatusTableName = changeReqTableName;
                            //T_ARMS_REQADD_145 -> T_ARMS_REQSTATUS_145
                            changeReqStatusTableName = StringUtility.replace(changeReqStatusTableName,
                                    "T_ARMS_REQADD_", "T_ARMS_REQSTATUS_");
                            SessionUtil.setAttribute("updateNode",changeReqStatusTableName);
                            ReqStatusDTO statusDTO = reqStatus.addNode(reqStatusDTO);
                            SessionUtil.removeAttribute("updateNode");

                            updateReqStatusIDs.add(statusDTO.getC_id().toString());
                        }

                    }else {
                        //이슈가 있으니까 비교해서 disable 처리 이후 생성하자
                        //등록된 이슈는 전부 disable 처리 한다.
                        for ( String issueID : issueInfoArr ) {
                            String changeReqStatusTableName = changeReqTableName;
                            //T_ARMS_REQADD_145 -> T_ARMS_REQSTATUS_145
                            changeReqStatusTableName = StringUtility.replace(changeReqStatusTableName,
                                    "T_ARMS_REQADD_", "T_ARMS_REQSTATUS_");
                            SessionUtil.setAttribute("updateNode",changeReqStatusTableName);

                            ReqStatusDTO reqStatusDTO = new ReqStatusDTO();
                            reqStatusDTO.setC_id(StringUtility.toLong(issueID));
                            reqStatusDTO.setC_title("disable");

                            reqStatus.updateNode(reqStatusDTO);

                            SessionUtil.removeAttribute("updateNode");
                        }

                        for ( String jiraVerID : jiraVerInfoArr ) {

                            PdServiceJiraVerDTO pdServiceJiraVerDTO = new PdServiceJiraVerDTO();
                            pdServiceJiraVerDTO.setC_id(StringUtility.toLong(jiraVerID));
                            PdServiceJiraVerDTO jiraVerDTO = pdServiceJiraVer.getNode(pdServiceJiraVerDTO);

                            String changeReqStatusTableName = changeReqTableName;
                            //T_ARMS_REQADD_145 -> T_ARMS_REQSTATUS_145
                            changeReqStatusTableName = StringUtility.replace(changeReqStatusTableName,
                                    "T_ARMS_REQADD_", "T_ARMS_REQSTATUS_");
                            SessionUtil.setAttribute("updateNode",changeReqStatusTableName);
                            ReqStatusDTO reqStatusDTO = new ReqStatusDTO();
                            reqStatusDTO.setWhere("c_pdservice_link",jiraVerDTO.getC_pdservice_id());
                            reqStatusDTO.setWhere("c_version_link",jiraVerDTO.getC_pdservice_version_id());
                            reqStatusDTO.setWhere("c_jira_project_link",jiraVerDTO.getC_pdservice_jira_id());
                            reqStatusDTO.setWhere("c_jira_version_link",jiraVerDTO.getC_id());
                            ReqStatusDTO statusDTO = reqStatus.getNode(reqStatusDTO);

                            if(statusDTO == null){
                                //없으면 생성
                                ReqStatusDTO reqStatusAddDTO = new ReqStatusDTO();

                                reqStatusAddDTO.setRef(2L);
                                reqStatusAddDTO.setC_type("default");
                                reqStatusAddDTO.setC_title("enable");

                                reqStatusAddDTO.setC_pdservice_link(jiraVerDTO.getC_pdservice_id());
                                reqStatusAddDTO.setC_pdservice_name(jiraVerDTO.getC_pdservice_name());

                                reqStatusAddDTO.setC_version_link(jiraVerDTO.getC_pdservice_version_id());
                                reqStatusAddDTO.setC_version_name(jiraVerDTO.getC_pdservice_version_name());

                                reqStatusAddDTO.setC_jira_project_link(jiraVerDTO.getC_pdservice_jira_id());
                                reqStatusAddDTO.setC_jira_project_name(jiraVerDTO.getC_pdservice_jira_name());
                                reqStatusAddDTO.setC_jira_project_key(jiraVerDTO.getC_pdservice_jira_key());
                                reqStatusAddDTO.setC_jira_project_url(jiraVerDTO.getC_pdservice_jira_link());

                                reqStatusAddDTO.setC_jira_version_link(jiraVerDTO.getC_id());
                                reqStatusAddDTO.setC_jira_version_name(jiraVerDTO.getC_jiraversion_name());
                                reqStatusAddDTO.setC_jira_version_url(jiraVerDTO.getC_jiraversion_link());
                                reqStatusAddDTO.setC_jira_version_title(jiraVerDTO.getC_title());

                                //REQADD 의 요구사항 아이디, 타이틀
                                reqStatusAddDTO.setC_req_link(addDTO.getC_id());
                                reqStatusAddDTO.setC_req_name(addDTO.getC_title());


                                ReqStatusDTO checkAddDTO = reqStatus.addNode(reqStatusAddDTO);
                                updateReqStatusIDs.add(checkAddDTO.getC_id().toString());

                            }else{
                                //있으면 enable
                                statusDTO.setC_title("enable");
                                statusDTO.setC_req_link(addDTO.getC_id());
                                statusDTO.setC_req_name(addDTO.getC_title());

                                reqStatus.updateNode(statusDTO);
                                updateReqStatusIDs.add(statusDTO.getC_id().toString());
                            }
                            SessionUtil.removeAttribute("updateNode");

                        }

                    }


                }


            }else{
                //버전 정보가 있다는 뜻. -> 버전 처리를 할 수 있는 방법이 UI 상에 없음.


            }

            String reviewer01 = addDTO.getC_reviewer01();
            reqReviewAddNode(addDTO, addDTO.getC_pdservice_link(), reviewer01);

            String reviewer02 = addDTO.getC_reviewer02();
            reqReviewAddNode(addDTO, addDTO.getC_pdservice_link(), reviewer02);

            String reviewer03 = addDTO.getC_reviewer03();
            reqReviewAddNode(addDTO, addDTO.getC_pdservice_link(), reviewer03);

            String reviewer04 = addDTO.getC_reviewer04();
            reqReviewAddNode(addDTO, addDTO.getC_pdservice_link(), reviewer04);

            String reviewer05 = addDTO.getC_reviewer05();
            reqReviewAddNode(addDTO, addDTO.getC_pdservice_link(), reviewer05);

            reqReviewDataClean(addDTO, addDTO.getC_pdservice_link(), reviewer01, reviewer02, reviewer03, reviewer04, reviewer05);

            String issueLinkResult = updateReqStatusIDs.stream().collect(Collectors.joining(","));
            addDTO.setC_issue_link(issueLinkResult);

            SessionUtil.setAttribute("updateNode",changeReqTableName);

            reqAdd.updateNode(addDTO);

            SessionUtil.removeAttribute("updateNode");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", "god");

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
