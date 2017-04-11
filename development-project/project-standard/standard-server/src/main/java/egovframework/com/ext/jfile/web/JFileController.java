/*
 * eGovFrame JFile
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 정호열 커미터(표준프레임워크 오픈커뮤니티 리더)
 */
package egovframework.com.ext.jfile.web;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.ext.jfile.GlobalVariables;
import egovframework.com.ext.jfile.JProperties;
import egovframework.com.ext.jfile.service.JFile;
import egovframework.com.ext.jfile.service.JFileDetails;
import egovframework.com.ext.jfile.service.JFileService;
import egovframework.com.ext.jfile.service.impl.JFileVO;
import egovframework.com.ext.jfile.session.SessionUploadChecker;
import egovframework.com.ext.jfile.utils.DateUtils;
import egovframework.com.ext.jfile.view.JSonView;
import egovframework.com.ext.jfile.view.JfileDownloadView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JFileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(JFileController.class);

	@Resource(name="multipartResolver")
	private MultipartResolver multipartResolver;

	@Autowired
	private JFileService service;

	@RequestMapping("/jfile/jfileuploadForm.do")
	public String jfileuploadForm() {
		return "egovframework/com/ext/jfile/jfileuploadForm";
	}

	/**
	 * 파일 ID를 읽어온다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/readFileId.do")
	public ModelAndView readFileId(JFileVO fileVO, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);

		try {
			String fileId = service.getFileId(fileVO.getFileId(), request.getParameterValues("fileSeq"));
			modelAndView.addObject("fileId", fileId);
			SessionUploadChecker.check(request, fileId);
		} catch(RuntimeException e) {
			modelAndView.addObject("fileId", "errorFileId");
//			try {
//				response.sendError(GlovalVariables.Error.SYSTEM_ERROR, "");
//			} catch (IOException e1) {
//				e1.printStackTrace();
//			}
		}
		return modelAndView;
	}

	@RequestMapping("/jfile/uploadingCheck.do")
	public ModelAndView uploadingCheck(@ModelAttribute JFileVO fileVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);
		modelAndView.addObject("hasFileId", SessionUploadChecker.isContainsKey(request, fileVO.getFileId()));
		modelAndView.addObject("maxInactiveInterval", request.getSession().getMaxInactiveInterval());
		LOGGER.debug("\nlastAccessTime : " + DateUtils.getDateString(request.getSession().getLastAccessedTime(), "yyyy.MM.dd HH:mm:ss"));
		return modelAndView;
	}

	/**
	 * 파일 업로드 실행
	 * @param fileVo
	 * @param request
	 * @return
	 */
	@RequestMapping("/jfile/processUpload.do")
	public ModelAndView processUpload(@ModelAttribute JFileVO fileVo, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);
		if(multipartResolver.isMultipart(request)) {
			final MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

			Collection<MultipartFile> values = multiRequest.getFileMap().values();
			boolean exceedFileNameLength = isExceedFileNameLength(values);
			if (exceedFileNameLength) {
				try {
					response.sendError(GlobalVariables.Error.FILE_LENGTH_ERROR, "");
				} catch (IOException e) {
					EgovBasicLogger.debug("Reponse send error", e);
				}
			} else {
				try {
					service.upload(values, fileVo);
				} finally {
					SessionUploadChecker.unCheck(request, fileVo.getFileId());
				}
			}

		}

		return modelAndView;
	}

	private boolean isExceedFileNameLength(Collection<MultipartFile> values) {

		if(values != null) {
			for(MultipartFile mfile : values) {
				if(mfile.getOriginalFilename().length() > 99) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 파일업로드가 완료된 후 처리 작업을 수행한다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/afterProcessUploadCompleted.do")
	public ModelAndView afterProcessUploadCompleted(JFileVO fileVO, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);
		try {
			service.executeAfterUploadCompleted(fileVO.getFileId());
			SessionUploadChecker.unCheck(request, fileVO.getFileId());
		} catch (RuntimeException e) {
			try {
				response.sendError(GlobalVariables.Error.SYSTEM_ERROR, "");
			} catch (IOException e1) {
				EgovBasicLogger.debug("Reponse send error", e1);
			}
		}
		return modelAndView;
	}

	/**
	 * 파일 아이디로 첨부파일 목록을 읽어온다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/readFiles.do")
	public ModelAndView readFiles(JFileVO fileVO) {
		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);
		List<JFileDetails> fileList= service.getAttachFiles(fileVO.getFileId());
		modelAndView.addObject("fileList", fileList);
		return modelAndView;
	}

	/**
	 *
	 */
	@RequestMapping("/jfile/jfiledownloadForm.do")
	public String jfiledownloadForm() {
		return "egovframework/com/ext/jfile/jfiledownloadForm";
	}


	/**
	 * 파일 아이디로 첨부파일 목록을 읽어온다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/readDownloadFiles.do")
	public ModelAndView readDownloadFiles(JFileVO fileVO) {
		ModelAndView modelAndView = new ModelAndView(JSonView.NAME);
		modelAndView.addObject("fileList", service.getAttachFiles(fileVO.getFileId()));
		return modelAndView;
	}

	/**
	 * 파일을 다운로드 받는다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/readDownloadFile.do")
	public ModelAndView readDownloadFile(JFileVO fileVO) {
		JFile downloadFile = service.getFile(fileVO.getFileId(), fileVO.getFileSeq(), fileVO.getUseSecurity());
		// 다운로드 카운트를 증가 시킨다.
		service.updateAttachFileDownloadCountBySequence(fileVO.getFileId(), fileVO.getFileSeq());
        return new ModelAndView(JfileDownloadView.NAME, JfileDownloadView.MODELNAME, downloadFile);
	}

	/**
	 * 멀티 업로드된 모든 파일을 zip로 압축하여 다운로드 받는다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/downloadAll.do")
	public ModelAndView downloadAll(JFileVO fileVO) {
		JFile[] downloadZipFile = service.getFiles(fileVO.getFileId(), fileVO.getUseSecurity());
		service.updateAttachFileDownloadCountByFileId(fileVO.getFileId());
		return new ModelAndView(JfileDownloadView.NAME, JfileDownloadView.MODELNAME, downloadZipFile);
	}

	/**
	 * 이미지 파일일 경우 미리보기를 한다.
	 * @param fileVO
	 * @return
	 */
	@RequestMapping("/jfile/preview.do")
	public ModelAndView preview(JFileVO fileVO) {
		JFileDetails prevFileVO = null;
		prevFileVO = service.getAttachFile(fileVO.getFileId(), fileVO.getFileSeq());

		JFile previewFile = prevFileVO.isImage() ?
				service.getFileBySequence(fileVO.getFileId(), fileVO.getFileSeq(), fileVO.getUseSecurity()) : new JFile(getNoImagePath());
		return new ModelAndView(JfileDownloadView.NAME, JfileDownloadView.MODELNAME, previewFile);
	}

	/**
	 * 이미지 경로를 읽어온다.
	 * @return
	 */
	private String getNoImagePath() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		return request.getSession().getServletContext().getRealPath("/") + JProperties.getString(GlobalVariables.DEFAULT_NO_IMAGE_APP_PATH_KEY);
	}

}