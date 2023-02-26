/*
 * @author Dongmin.lee
 * @since 2022-06-17
 * @version 22.06.17
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_pdservice.controller;

import egovframework.api.arms.module_armsmaker.model.ArmsInstallDB_SqlMaaperDTO;
import egovframework.api.arms.module_armsmaker.service.ArmsInstallDB;
import egovframework.api.arms.module_filerepository.model.FileRepositoryDTO;
import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;
import egovframework.api.arms.module_pdserviceversion.model.PdServiceVersionDTO;
import egovframework.api.arms.module_pdserviceversion.service.PdServiceVersion;
import egovframework.api.arms.util.FileHandler;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.support.util.ParameterParser;
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
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.util.*;

@Slf4j
@Controller
@CrossOrigin(origins = "http://localhost:9999")
@RequestMapping(value = {"/auth-user/api/arms/pdService"})
public class UserPdServiceController extends SHVAbstractController<PdService, PdServiceDTO> {

    @Autowired
    @Qualifier("pdService")
    private PdService pdService;

    @Autowired
    @Qualifier("fileRepository")
    private FileRepository fileRepository;

    @Autowired
    @Qualifier("pdServiceVersion")
    private PdServiceVersion pdServiceVersion;

    @Resource(name = "reqAddTemplateInstallDB")
    ArmsInstallDB reqAddTemplateInstallDB;

    @Resource(name = "reqStatusTemplateInstallDB")
    ArmsInstallDB reqStatusTemplateInstallDB;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdService);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private static final Long ROOT_NODE_ID = new Long(2);
    private static final String NODE_TYPE = new String("default");
    private static final String REQ_PREFIX_TABLENAME_BY_PDSERVICE = new String("T_ARMS_REQADD_");
    private static final String REQ_PREFIX_TABLENAME_BY_PDSERVICE_STATUS = new String("T_ARMS_REQSTATUS_");

    @ResponseBody
    @RequestMapping(
            value = {"/addPdServiceNode.do"},
            method = {RequestMethod.POST}
    )
    public ModelAndView addNode(@Validated({AddNode.class}) PdServiceDTO pdServiceDTO,
                                BindingResult bindingResult, ModelMap model) throws Exception {

        if (bindingResult.hasErrors()) {
            throw new RuntimeException();
        } else {
            pdServiceDTO.setC_title(Util_TitleChecker.StringReplace(pdServiceDTO.getC_title()));

            PdServiceDTO addedNode = pdService.addNode(pdServiceDTO);

            //제품(서비스) 생성시 - 요구사항 TABLE 생성
            ArmsInstallDB_SqlMaaperDTO armsInstallDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
            armsInstallDB_sqlMaaperDTO.setC_title(REQ_PREFIX_TABLENAME_BY_PDSERVICE + addedNode.getC_id().toString());
            armsInstallDB_sqlMaaperDTO.setSqlMapSelector("arms-reqadd-template");

            reqAddTemplateInstallDB.sqlMapExecute(armsInstallDB_sqlMaaperDTO);

            //C_ETC 컬럼에 요구사항 테이블 이름 기입
            addedNode.setC_etc(REQ_PREFIX_TABLENAME_BY_PDSERVICE + addedNode.getC_id().toString());
            pdService.updateNode(addedNode);

            //제품(서비스) 생성시 - 요구사항 STATUS TABLE 생성
            ArmsInstallDB_SqlMaaperDTO armsInstall_statusDB_sqlMaaperDTO = new ArmsInstallDB_SqlMaaperDTO();
            armsInstall_statusDB_sqlMaaperDTO.setC_title(REQ_PREFIX_TABLENAME_BY_PDSERVICE_STATUS + addedNode.getC_id().toString());
            armsInstall_statusDB_sqlMaaperDTO.setSqlMapSelector("arms-reqstatus-template");

            reqStatusTemplateInstallDB.sqlMapExecute(armsInstall_statusDB_sqlMaaperDTO);

            //Default Version 생성
            PdServiceVersionDTO pdServiceVersionDTO = new PdServiceVersionDTO();
            pdServiceVersionDTO.setRef(2L);
            pdServiceVersionDTO.setC_title("BaseVersion");
            pdServiceVersionDTO.setC_type("default");
            pdServiceVersionDTO.setC_pdservice_link(addedNode.getC_id().toString());
            pdServiceVersion.addNode(pdServiceVersionDTO);

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", addedNode);
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/addEndNodeByRoot.do", method = RequestMethod.POST)
    public ModelAndView addEndNodeByRoot(PdServiceDTO pdServiceDTO,
                                         BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();

        //루트 노드를 기준으로 리스트를 검색
        PdServiceDTO paramPdServiceDTO = new PdServiceDTO();
        paramPdServiceDTO.setWhere("c_parentid", ROOT_NODE_ID);
        List<PdServiceDTO> list = pdService.getChildNode(paramPdServiceDTO);

        //검색된 노드중 maxPosition을 찾는다.
        PdServiceDTO maxPositionPdServiceDTO = list
                .stream()
                .max(Comparator.comparing(PdServiceDTO::getC_position))
                .orElseThrow(NoSuchElementException::new);

        //노드 값 셋팅
        pdServiceDTO.setRef(ROOT_NODE_ID);
        pdServiceDTO.setC_position(maxPositionPdServiceDTO.getC_position() + 1);
        pdServiceDTO.setC_type(NODE_TYPE);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdService.addNode(pdServiceDTO));

        return modelAndView;
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
        String c_title = "pdService";

        HashMap<String, List<EgovFormBasedFileVo>> map = FileHandler.upload(multiRequest, fileIdLink, c_title, fileRepository, logger);
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", map);

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/getPdServiceMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getPdServiceMonitor(PdServiceDTO pdServiceDTO, ModelMap model, HttpServletRequest request) throws Exception {
        pdServiceDTO.setOrder(Order.asc("c_id"));
        Criterion criterion = Restrictions.not(
                // replace "id" below with property name, depending on what you're filtering against
                Restrictions.in("c_id", new Object[] {1L, 2L})
        );
        pdServiceDTO.getCriterions().add(criterion);
        List<PdServiceDTO> list = this.pdService.getChildNode(pdServiceDTO);
        for (PdServiceDTO dto: list) {
            dto.setC_contents("force empty");
        }
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}