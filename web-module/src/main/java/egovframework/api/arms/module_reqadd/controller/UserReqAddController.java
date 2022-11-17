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
import egovframework.api.arms.module_reqadd.model.ReqAddDTO;
import egovframework.api.arms.module_reqadd.model.ReqAddSqlMaaperDTO;
import egovframework.api.arms.module_reqadd.service.ReqAdd;
import egovframework.api.arms.module_reqadd.service.ReqAddSqlMapper;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.springHibernate.core.interceptor.SessionUtil;
import egovframework.com.ext.jstree.springHibernate.core.util.Util_TitleChecker;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.AddNode;
import egovframework.com.ext.jstree.springHibernate.core.validation.group.MoveNode;
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
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/reqAdd"})
public class UserReqAddController extends SHVAbstractController<ReqAdd, ReqAddDTO> {

    @Autowired
    @Qualifier("reqAdd")
    private ReqAdd reqAdd;

    @Resource(name = "reqAddSqlMapper")
    ReqAddSqlMapper reqAddSqlMapper;

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

        SessionUtil.setAttribute("replaceTableName",changeReqTableName);

        reqAddDTO.setOrder(Order.asc("c_left"));
        List<ReqAddDTO> list = this.reqAdd.getChildNode(reqAddDTO);

        SessionUtil.removeAttribute("replaceTableName");

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

            SessionUtil.setAttribute("replaceTableName",changeReqTableName);

            V returnVO = reqAdd.getNode(reqAddDTO);

            SessionUtil.removeAttribute("replaceTableName");

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

            SessionUtil.setAttribute("replaceTableName",changeReqTableName);

            reqAddDTO.setWhere("c_parentid", new Long(parser.get("c_id")));
            List<ReqAddDTO> list = reqAdd.getChildNode(reqAddDTO);

            SessionUtil.removeAttribute("replaceTableName");

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

            SessionUtil.setAttribute("replaceTableName",changeReqTableName);

            //쿼리
            Criterion criterion1 = Restrictions.ge("c_left", reqAddDTO.getC_left());
            Criterion criterion2 = Restrictions.and(Restrictions.le("c_right", reqAddDTO.getC_right()));
            reqAddDTO.getCriterions().add(criterion1);
            reqAddDTO.getCriterions().add(criterion2);
            reqAddDTO.setOrder(Order.asc("c_left"));
            reqAddDTO.setC_id(null);

            List<ReqAddDTO> list = reqAdd.getChildNode(reqAddDTO);
            SessionUtil.removeAttribute("replaceTableName");

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

            SessionUtil.setAttribute("replaceTableName",changeReqTableName);

            reqAddDTO.setC_title(Util_TitleChecker.StringReplace(reqAddDTO.getC_title()));
            ReqAddDTO returnNode = reqAdd.addNode(reqAddDTO);

            SessionUtil.removeAttribute("replaceTableName");

            ModelAndView modelAndView = new ModelAndView("jsonView");
            modelAndView.addObject("result", returnNode);
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

            SessionUtil.setAttribute("replaceTableName",changeReqTableName);

            this.reqAdd.moveNode(reqAddDTO, request);
            super.setJsonDefaultSetting(reqAddDTO);

            SessionUtil.removeAttribute("replaceTableName");

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

    @Resource(name = "egov.dataSource")
    DataSource dataSource;

    @ResponseBody
    @RequestMapping(
            value = {"/makeDB.do"},
            method = {RequestMethod.GET}
    )
    public ModelAndView makeDefaultDB(ReqAddSqlMaaperDTO reqAddSqlMaaperDTO, HttpServletRequest request) throws Exception {

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
            makeTrigger(reqAddSqlMaaperDTO);
        }

        ModelAndView modelAndView =  new ModelAndView("jsonView");
        modelAndView.addObject("result", "good");
        return modelAndView;
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

}
