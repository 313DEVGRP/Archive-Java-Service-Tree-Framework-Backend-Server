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

import egovframework.api.arms.module_filerepository.model.FileRepositoryDTO;
import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;
import egovframework.api.arms.module_pdversion.model.PdVersionDTO;
import egovframework.api.arms.module_pdversion.service.PdVersion;
import egovframework.api.arms.module_reqadd.model.ReqAddSqlMaaperDTO;
import egovframework.api.arms.module_reqadd.service.ReqAddSqlMapper;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.vo.JsTreeHibernateSearchDTO;
import egovframework.com.ext.jstree.springiBatis.core.service.CoreService;
import egovframework.com.ext.jstree.springiBatis.core.vo.ComprehensiveTree;
import egovframework.com.utl.fcc.service.EgovFileUploadUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.criterion.Order;
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
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.NoSuchElementException;

@Slf4j
@Controller
@CrossOrigin(origins = "http://localhost:9999")
@RequestMapping(value = {"/auth-user/api/arms/pdservice"})
public class UserPdServiceController extends SHVAbstractController<PdService, PdServiceDTO> {

    @Autowired
    @Qualifier("pdService")
    private PdService pdService;

    @Autowired
    @Qualifier("fileRepository")
    private FileRepository fileRepository;

    @Autowired
    @Qualifier("pdVersion")
    private PdVersion pdVersion;

    @Resource(name = "reqAddSqlMapper")
    ReqAddSqlMapper reqAddSqlMapper;

    @Resource(name = "egov.dataSource")
    DataSource dataSource;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdService);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private static final Long ROOT_NODE_ID = new Long(2);
    private static final String NODE_TYPE = new String("default");
    private static final String REQ_PREFIX_TABLENAME_BY_PDSERVICE = new String("T_ARMS_REQADD_");

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
            ReqAddSqlMaaperDTO reqAddSqlMaaperDTO = new ReqAddSqlMaaperDTO();
            reqAddSqlMaaperDTO.setC_title(REQ_PREFIX_TABLENAME_BY_PDSERVICE + addedNode.getC_id().toString());
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
                makeTrigger(reqAddSqlMaaperDTO);
            }

            //C_ETC 컬럼에 요구사항 테이블 이름 기입
            addedNode.setC_etc(REQ_PREFIX_TABLENAME_BY_PDSERVICE + addedNode.getC_id().toString());
            pdService.updateNode(addedNode);

            //Default Version 생성
            PdVersionDTO pdVersionDTO = new PdVersionDTO();
            pdVersionDTO.setRef(2L);
            pdVersionDTO.setC_title("BaseVersion");
            pdVersionDTO.setC_type("default");
            pdVersionDTO.setC_pdservice_link(addedNode.getC_id().toString());
            pdVersion.addNode(pdVersionDTO);

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", addedNode);
            return modelAndView;
        }
    }

    private void makeTrigger(ReqAddSqlMaaperDTO reqAddSqlMaaperDTO) throws SQLException {
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        String sql =
                "CREATE OR REPLACE TRIGGER \"TRIG_" + reqAddSqlMaaperDTO.getC_title() + "\"\n" +
                "BEFORE DELETE OR INSERT OR UPDATE\n" +
                "ON " + reqAddSqlMaaperDTO.getC_title() + " REFERENCING NEW AS NEW OLD AS OLD\n" +
                "FOR EACH ROW\n" +
                "DECLARE\n" +
                "tmpVar NUMBER;\n" +
                "/******************************************************************************\n" +
                "   NAME:       TRIGGER_COMPREHENSIVETREE\n" +
                "   PURPOSE:    \n" +
                " \n" +
                "   REVISIONS:\n" +
                "   Ver        Date        Author           Description\n" +
                "   ---------  ----------  ---------------  ------------------------------------\n" +
                "   1.0        2012-08-29             1. Created this trigger.\n" +
                " \n" +
                "   NOTES:\n" +
                " \n" +
                "   Automatically available Auto Replace Keywords:\n" +
                "      Object Name:     TRIGGER_COMPREHENSIVETREE\n" +
                "      Sysdate:         2012-08-29\n" +
                "      Date and Time:   2012-08-29, 오후 5:26:44, and 2012-08-29 오후 5:26:44\n" +
                "      Username:         (set in TOAD Options, Proc Templates)\n" +
                "      Table Name:      T_ARMS_REQADD (set in the \"New PL/SQL Object\" dialog)\n" +
                "      Trigger Options:  (set in the \"New PL/SQL Object\" dialog)\n" +
                "******************************************************************************/\n" +
                "BEGIN\n" +
                "  tmpVar := 0;\n" +
                "   IF UPDATING  THEN    \n" +
                "       insert into " + reqAddSqlMaaperDTO.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE)\n" +
                "       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'update','변경이전데이터',sysdate);        \n" +
                "       insert into " + reqAddSqlMaaperDTO.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE)\n" +
                "       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'update','변경이후데이터',sysdate);   \n" +
                "    END IF;\n" +
                "   IF DELETING THEN\n" +
                "       insert into " + reqAddSqlMaaperDTO.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE)\n" +
                "       values (:old.C_ID,:old.C_PARENTID,:old.C_POSITION,:old.C_LEFT,:old.C_RIGHT,:old.C_LEVEL,:old.C_TITLE,:old.C_TYPE,'delete','삭제된데이터',sysdate);\n" +
                "   END IF;   \n" +
                "   IF INSERTING  THEN\n" +
                "       insert into " + reqAddSqlMaaperDTO.getC_title() + "_LOG (C_ID,C_PARENTID,C_POSITION,C_LEFT,C_RIGHT,C_LEVEL,C_TITLE,C_TYPE,C_METHOD,C_STATE,C_DATE)\n" +
                "       values (:new.C_ID,:new.C_PARENTID,:new.C_POSITION,:new.C_LEFT,:new.C_RIGHT,:new.C_LEVEL,:new.C_TITLE,:new.C_TYPE,'insert','삽입된데이터',sysdate);\n" +
                "   END IF;\n" +
                " \n" +
                "  EXCEPTION\n" +
                "    WHEN OTHERS THEN\n" +
                "      -- Consider logging the error and then re-raise\n" +
                "      RAISE;\n" +
                "END TRIG_" + reqAddSqlMaaperDTO.getC_title() + ";";
        statement.execute(sql);
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

        logger.info("=======" + maxPositionPdServiceDTO);

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
    public ModelAndView uploadFileToNode(final MultipartHttpServletRequest multiRequest, @RequestParam("fileIdLink") Long fileIdLink, Model model) throws Exception {

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
            fileRepositoryDTO.setC_title("pdService");
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
        if (list.size() > 0) {
            EgovFormBasedFileVo vo = list.get(0);    // 첫번째 이미지

//            String url = multiRequest.getContextPath()
//                    + "/utl/web/imageSrc.do?"
//                    + "path=" + vo.getServerSubPath()
//                    + "&physical=" + vo.getPhysicalName()
//                    + "&contentType=" + vo.getContentType();

            //model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
            //model.addAttribute("url", url);
        }
        HashMap<String, List<EgovFormBasedFileVo>> map = new HashMap();
        map.put("files", list);
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", map);

        return modelAndView;
    }

    @RequestMapping(value="/updateContentsToNode.do", method=RequestMethod.POST)
    public ModelAndView updateContentsToNode(PdServiceDTO pdServiceDTO,
                                       BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdService.updateContentsNode(pdServiceDTO));

        return modelAndView;
    }

    @RequestMapping(value="/updatePdServiceNode.do", method=RequestMethod.POST)
    public ModelAndView updatePdServiceNode(PdServiceDTO pdServiceDTO,
                                          BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            throw new RuntimeException();


        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", pdService.updatePdServiceNode(pdServiceDTO));

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(
            value = {"/getPdServiceMonitor.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView getPdServiceMonitor(PdServiceDTO pdServiceDTO, ModelMap model, HttpServletRequest request) throws Exception {
        pdServiceDTO.setOrder(Order.asc("c_id"));
        List<PdServiceDTO> list = this.pdService.getChildNode(pdServiceDTO);
        for (PdServiceDTO dto: list) {
            dto.setC_contents("force empty");
        }
        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", list);
        return modelAndView;
    }
}