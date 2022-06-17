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

import egovframework.com.utl.fcc.service.EgovFileUploadUtil;
import egovframework.com.utl.fcc.service.EgovFormBasedFileVo;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;

import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;

import egovframework.api.arms.module_pdservice.model.PdServiceDTO;
import egovframework.api.arms.module_pdservice.service.PdService;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/pdservice"})
public class UserPdServiceController extends SHVAbstractController<PdService, PdServiceDTO> {

    @Autowired
    @Qualifier("pdService")
    private PdService pdService;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(pdService);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());


    private static final Long ROOT_NODE_ID = new Long(2);
    private static final String NODE_TYPE = new String("default");

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
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/uploadFileToNode.do", method=RequestMethod.POST)
    public String uploadFileToNode(HttpServletRequest request, Model model) throws Exception {
        // Spring multipartResolver 미사용 시 (commons-fileupload 활용)
        //List<EgovFormBasedFileVo> list = EgovFormBasedFileUtil.uploadFiles(request, uploadDir, maxFileSize);

        // Spring multipartResolver 사용시
        String uploadDir = "";
        long maxFileSize = new Long(313);
        List<EgovFormBasedFileVo> list = EgovFileUploadUtil.uploadFiles(request, uploadDir, maxFileSize);

        if (list.size() > 0) {
            EgovFormBasedFileVo vo = list.get(0);    // 첫번째 이미지

            String url = request.getContextPath()
                    + "/utl/web/imageSrc.do?"
                    + "path=" + vo.getServerSubPath()
                    + "&physical=" + vo.getPhysicalName()
                    + "&contentType=" + vo.getContentType();

            //model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
            model.addAttribute("url", url);
        }

        return "egovframework/com/utl/wed/EgovInsertImage";
    }

}