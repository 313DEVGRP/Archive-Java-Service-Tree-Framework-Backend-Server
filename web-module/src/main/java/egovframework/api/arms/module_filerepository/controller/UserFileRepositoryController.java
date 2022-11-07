/*
 * @author Dongmin.lee
 * @since 2022-11-04
 * @version 22.11.04
 * @see <pre>
 *  Copyright (C) 2007 by 313 DEV GRP, Inc - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential
 *  Written by 313 developer group <313@313.co.kr>, December 2010
 * </pre>
 */
package egovframework.api.arms.module_filerepository.controller;

import egovframework.api.arms.module_filerepository.model.FileRepositoryDTO;
import egovframework.api.arms.module_filerepository.service.FileRepository;
import egovframework.api.arms.util.PropertiesReader;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.ext.jstree.springHibernate.core.controller.SHVAbstractController;
import egovframework.com.ext.jstree.support.util.ParameterParser;
import egovframework.com.utl.fcc.service.EgovFormBasedFileUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = {"/auth-user/api/arms/fileRepository"})
public class UserFileRepositoryController extends SHVAbstractController<FileRepository, FileRepositoryDTO> {

    @Autowired
    @Qualifier("fileRepository")
    private FileRepository fileRepository;

    @PostConstruct
    public void initialize() {
        setJsTreeHibernateService(fileRepository);
    }

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ResponseBody
    @RequestMapping(value = "/getFilesByNode.do", method = RequestMethod.GET)
    public ModelAndView getFilesByNode(FileRepositoryDTO fileRepositoryDTO, HttpServletRequest request) throws Exception {

        ParameterParser parser = new ParameterParser(request);

        fileRepositoryDTO.setWhere("fileIdLink", fileRepositoryDTO.getFileIdLink());
        List<FileRepositoryDTO> list = fileRepository.getChildNode(fileRepositoryDTO);

        HashMap<String, List<FileRepositoryDTO>> map = new HashMap();
        map.put("files", list);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", map);

        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value="/deleteFileByNode/{fileId}")
    public ModelAndView deleteFileByNode(@PathVariable(value ="fileId") Long fileId, ModelMap model,
                                HttpServletRequest request) throws Exception {

        FileRepositoryDTO fileRepositoryDTO = new FileRepositoryDTO();
        fileRepositoryDTO.setC_id(fileId);
        int result = fileRepository.removeNode(fileRepositoryDTO);

        ModelAndView modelAndView = new ModelAndView("jsonView");
        modelAndView.addObject("result", result);
        return modelAndView;
    }



    @RequestMapping(value="/downloadFileByNode/{fileId}")
    public void downloadFile(@PathVariable(value ="fileId") Long fileId,
                HttpServletRequest request, HttpServletResponse response) throws Exception {

        PropertiesReader propertiesReader = new PropertiesReader("egovframework/egovProps/globals.properties");
        String uploadPath = propertiesReader.getProperty("Globals.fileStorePath");

        FileRepositoryDTO fileRepositoryDTO = new FileRepositoryDTO();
        fileRepositoryDTO.setWhere("c_id", fileId);
        FileRepositoryDTO returnFileRepositoryDTO = fileRepository.getNode(fileRepositoryDTO);

        EgovFormBasedFileUtil.downloadFile(response, uploadPath
                , returnFileRepositoryDTO.getServerSubPath()
                , returnFileRepositoryDTO.getPhysicalName()
                , returnFileRepositoryDTO.getContentType()
                , returnFileRepositoryDTO.getFileName());

    }

}
