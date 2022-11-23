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

import egovframework.api.arms.module_filerepository.model.FileRepositoryDTO;
import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.api.arms.module_filerepositorylog.model.FileRepositoryLogDTO;
import egovframework.api.arms.module_filerepositorylog.service.FileRepositoryLog;
import egovframework.api.arms.module_pdserviceconnectlog.model.PdServiceConnectLogDTO;
import egovframework.api.arms.module_pdserviceconnectlog.service.PdServiceConnectLog;
import egovframework.api.arms.module_pdservicejiralog.service.PdServiceJiraLog;
import egovframework.api.arms.module_pdservicelog.model.PdServiceLogDTO;
import egovframework.api.arms.module_pdservicelog.service.PdServiceLog;
import egovframework.api.arms.module_pdserviceversionlog.model.PdServiceVersionLogDTO;
import egovframework.api.arms.module_pdserviceversionlog.service.PdServiceVersionLog;
import egovframework.api.arms.module_reqadd.model.JsTreeHibernateLogDTO;
import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqadd.service.ReqAdd;
import egovframework.api.arms.module_reqaddlog.service.ReqAddLog;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.MoveNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.UpdateNode;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import egovframework.com.ext.jstree.support.util.StringUtils;
import egovframework.com.utl.fcc.service.EgovFileUploadUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
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

            ReqAddDTO refReqAddDTO = new ReqAddDTO();
            refReqAddDTO.setC_id(reqAddDTO.getRef());
            //ReqAddDTO nodeByRef = reqAdd.getNode(refReqAddDTO);

            //ReqAddDTO returnNode = reqAdd.addNodeToSwitchTable(reqAddDTO, nodeByRef);
            ReqAddDTO returnNode = reqAdd.addNode(reqAddDTO);

            SessionUtil.removeAttribute("addNode");

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
            modelAndView.addObject("result", this.reqAdd.updateNode(reqAddDTO));

            SessionUtil.removeAttribute("updateNode");

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

//            ReqAddDTO refReqAddDTO = new ReqAddDTO();
//            refReqAddDTO.setC_id(reqAddDTO.getRef());
//            ReqAddDTO nodeByRef = reqAdd.getNode(refReqAddDTO);

            //this.reqAdd.moveNodeToSwitchTable(reqAddDTO, nodeByRef, request);
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
                                         @RequestParam("fileIdLink") Long fileIdLink,
                                         @RequestParam("c_title") String c_title,Model model) throws Exception {

        logger.info("fileIdLink -> " + fileIdLink);

        // Spring multipartResolver 미사용 시 (commons-fileupload 활용)
        //List<EgovFormBasedFileVo> list = EgovFormBasedFileUtil.uploadFiles(request, uploadDir, maxFileSize);

        // Spring multipartResolver 사용시
        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String uploadDir = propertiesReader.getProperty("Globals.fileStorePath");
        long maxFileSize = new Long(313);
        List<EgovFormBasedFileVo> list = EgovFileUploadUtil.uploadFiles(multiRequest, uploadDir, maxFileSize);

        for ( EgovFormBasedFileVo egovFormBasedFileVo : list) {

            FileRepositoryDTO fileRepositoryDTO = new FileRepositoryDTO();
            fileRepositoryDTO.setFileName(egovFormBasedFileVo.getFileName());
            fileRepositoryDTO.setContentType(egovFormBasedFileVo.getContentType());
            fileRepositoryDTO.setServerSubPath(egovFormBasedFileVo.getServerSubPath());
            fileRepositoryDTO.setPhysicalName(egovFormBasedFileVo.getPhysicalName());
            fileRepositoryDTO.setSize(egovFormBasedFileVo.getSize());
            fileRepositoryDTO.setName(egovFormBasedFileVo.getName());

            fileRepositoryDTO.setUrl(egovFormBasedFileVo.getUrl());
            //TODO: 썸네일 개발 필요
            fileRepositoryDTO.setThumbnailUrl(egovFormBasedFileVo.getThumbnailUrl());

            fileRepositoryDTO.setDelete_url(egovFormBasedFileVo.getDelete_url());
            fileRepositoryDTO.setDelete_type(egovFormBasedFileVo.getDelete_type());
            fileRepositoryDTO.setFileIdLink(fileIdLink);

            fileRepositoryDTO.setRef(new Long(1));
            fileRepositoryDTO.setC_title(c_title);
            fileRepositoryDTO.setC_type("default");

            FileRepositoryDTO returnFileRepositoryDTO = fileRepository.addNode(fileRepositoryDTO);
            //delete 파라미터인 id 값을 업데이트 치기 위해서.
            fileRepositoryDTO.setUrl("/auth-user/api/arms/fileRepository" + "/downloadFileByNode/" + returnFileRepositoryDTO.getId());
            fileRepositoryDTO.setThumbnailUrl("/auth-user/api/arms/fileRepository" + "/thumbnailUrlFileToNode/" + returnFileRepositoryDTO.getId());
            fileRepositoryDTO.setDelete_url("/auth-user/api/arms/fileRepository" + "/deleteFileByNode/" + returnFileRepositoryDTO.getId());

            fileRepository.updateNode(fileRepositoryDTO);

            egovFormBasedFileVo.setUrl("/auth-user/api/arms/fileRepository" + "/downloadFileByNode/" + returnFileRepositoryDTO.getId());
            egovFormBasedFileVo.setThumbnailUrl("/auth-user/api/arms/fileRepository" + "/thumbnailUrlFileToNode/" + returnFileRepositoryDTO.getId());
            egovFormBasedFileVo.setDelete_url("/auth-user/api/arms/fileRepository" + "/deleteFileByNode/" + returnFileRepositoryDTO.getId());

        }
        HashMap<String, List<EgovFormBasedFileVo>> map = new HashMap();
        map.put("files", list);
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
            value = {"/getHistory.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getHistory(
            ModelMap model, HttpServletRequest request) throws Exception {

        /**
         * Required Fields
         * - 이 필드들은 페이징 계산을 위해 반드시 입력되어야 하는 필드 값들이다.
         *
         * currentPageNo : 현재 페이지 번호
         * recordCountPerPage : 한 페이지당 게시되는 게시물 건 수
         * pageSize : 페이지 리스트에 게시되는 페이지 건수,
         * totalRecordCount : 전체 게시물 건 수.
         *
         * PaginationInfo paginationInfo = jsTreeHibernateDTO.getPaginationInfo();
         * paginationInfo.setCurrentPageNo(jsTreeHibernateDTO.getPageIndex());
         * paginationInfo.setRecordCountPerPage(jsTreeHibernateDTO.getPageUnit());
         * paginationInfo.setPageSize(jsTreeHibernateDTO.getPageSize());
         */

        ParameterParser parser = new ParameterParser(request);
//        logger.info("PageIndex = " + parser.getInt("PageIndex"));
//        logger.info("PageUnit = " + parser.getLong("PageUnit"));
//        logger.info("PageSize = " + parser.getLong("PageSize"));

        // 문자열
        String startDateStr = parser.get("startDate");
        // 포맷터
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        // 문자열 -> Date
        Date startDate = formatter.parse(startDateStr);

        Timestamp startTimestamp = new Timestamp(startDate.getTime());
        logger.info("startTimestamp === " + startTimestamp); // format을 사용해 출력

        // 문자열
        String endDateStr = parser.get("endDate");
        // 문자열 -> Date
        Date endDate = formatter.parse(endDateStr);

        Timestamp endTimestamp = new Timestamp(endDate.getTime());
        logger.info("endTimestamp === " + endTimestamp); // format을 사용해 출력

        FileRepositoryLogDTO fileRepositoryLogDTO = new FileRepositoryLogDTO();
        fileRepositoryLogDTO.setWhereBetween("c_date", startDate, endDate);
        fileRepositoryLogDTO.setOrder(Order.asc("c_left"));
        fileRepositoryLogDTO.setWhere("c_title", "pdService");
        fileRepositoryLogDTO.setWhere("fileIdLink", parser.getLong("fileIdLink"));
        List<FileRepositoryLogDTO> fileRepositoryLogList = fileRepositoryLog.getChildNode(fileRepositoryLogDTO);

        PdServiceConnectLogDTO pdServiceConnectLogDTO = new PdServiceConnectLogDTO();
        fileRepositoryLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
        pdServiceConnectLogDTO.setOrder(Order.asc("c_left"));
        pdServiceConnectLogDTO.setWhere("c_pdservice_id", parser.get("c_id"));
        List<PdServiceConnectLogDTO> pdServiceConnectLogDTOList = this.pdServiceConnectLog.getChildNode(pdServiceConnectLogDTO);

        PdServiceVersionLogDTO pdServiceVersionLogDTO = new PdServiceVersionLogDTO();
        fileRepositoryLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
        pdServiceVersionLogDTO.setOrder(Order.asc("c_left"));
        pdServiceVersionLogDTO.setWhere("c_pdservice_link", parser.get("c_id"));
        List<PdServiceVersionLogDTO> pdServiceVersionLogDTOList = this.pdServiceVersionLog.getChildNode(pdServiceVersionLogDTO);

        PdServiceLogDTO pdServiceLogDTO = new PdServiceLogDTO();
        fileRepositoryLogDTO.setWhereBetween("c_date", startTimestamp, endTimestamp);
        pdServiceLogDTO.setOrder(Order.asc("c_left"));
        pdServiceLogDTO.setWhere("c_id", parser.getLong("c_id"));
        List<PdServiceLogDTO> pdServiceLogDTOList = this.pdServiceLog.getChildNode(pdServiceLogDTO);

        List<JsTreeHibernateLogDTO> mergeList = new ArrayList<>();
        mergeList.addAll(fileRepositoryLogList);
        mergeList.addAll(pdServiceLogDTOList);
        mergeList.addAll(pdServiceConnectLogDTOList);
        mergeList.addAll(pdServiceVersionLogDTOList);


//        int currentBlock = parser.getInt("PageIndex")/parser.getInt("PageSize");
//        int pageBlock = parser.getInt("PageUnit");
//        int startNum =  currentBlock*pageBlock+1;
//        int endNum = currentBlock*pageBlock+pageBlock+1;
        List<JsTreeHibernateLogDTO> ascTD = mergeList.stream() // Sort Order By asc - Comparator의 comparing 사용, ::를 활용한 참조 방식 사용, stream을 활용한 List의 sorted사용 및 collect를 활용한 Collectors.toList() 사용
                .sorted(Comparator.comparing(JsTreeHibernateLogDTO::getC_date))
                .collect(Collectors.toList());


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", ascTD);
        return modelAndView;
    }

}
