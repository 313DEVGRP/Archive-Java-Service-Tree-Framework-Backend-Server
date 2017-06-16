package egovframework.com.ext.jfile.service.template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import egovframework.com.ext.jfile.GlobalVariables;
import egovframework.com.ext.jfile.JProperties;
import egovframework.com.ext.jfile.exception.JFileException;
import egovframework.com.ext.jfile.security.service.CipherService;
import egovframework.com.ext.jfile.service.FileUploadCompletedEventListener;
import egovframework.com.ext.jfile.service.JFile;
import egovframework.com.ext.jfile.service.JFileDetails;
import egovframework.com.ext.jfile.service.strategy.JFileUploadTypeFactory;
import egovframework.com.ext.jfile.utils.KeyHelper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 *  클래스
 * @author 정호열
 * @since 2010.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2010.10.17   정호열       최초 생성
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경)
 *   2017-02-13  이정은	 		시큐어코딩(ES) - 시큐어코딩 부적절한 예외 처리[CWE-253, CWE-440, CWE-754]   	
 * </pre>
 */
public abstract class JFileUploadModeTemplate extends EgovAbstractServiceImpl {

	/** 로거 */
	private static final Logger LOGGER = LoggerFactory.getLogger(JFileUploadModeTemplate.class);

	/** 프로퍼티 파일에 정의된 uploadpath 키 */
	private String uploadPathKey;

	/** 암호화 서비스 객체 */
	private CipherService cipherService;

	/** DB모드 */
	protected static final String DB_MODE = "db";

	/** 파일업로드 이벤트 리스너 */
	private Collection<FileUploadCompletedEventListener> fileUploadCompletedEventListeners;

	/**
	 * 파일아이디가 없다면 새로 생성하여 주고 있으면 있던 값을 반환한다.
	 * @param fileId 파일 아이디
	 * @param fileSeq 파일 시퀀스
	 * @return String 파일 아이디
	 */
	public String getFileId(String fileId) {
		return null == fileId || "".equals(fileId) ? KeyHelper.getStringKey() : fileId;
	}

	/**
	 * 마스킹 된 파일명, 파일 모드, 파일 경로를 전달 받아 파일의 전체경로를 반환한다.
	 * @param maskingName 마스킹 된 파일명.
	 * @param uploadMode 업로드 모드.
	 * @param uploadPath 업로드 패스.
	 * @return String 서버에 저장된 전체파일경로.
	 */
	public String getUploadFilePullPath(String maskingName, String uploadMode, String uploadPath) {
		return getUploadDirectoryPath(uploadPath, uploadMode).concat(maskingName);
	}

	/**
	 * 파일명이 포함된 업로드 경로, 업로드 모드를 전달받아 디렉터리 경로를반환한다.
	 * @param uploadPath 업로드 경로
	 * @param uploadMode 업로드모드.
	 * @return String 디렉터리 경로.
	 */
	public String getUploadDirectoryPath(String uploadPath, String uploadMode) {
		StringBuilder uploadPathSb = new StringBuilder();
		uploadPathSb.append(getFileUploadDirectoryPath(uploadMode, uploadPath));
		mkdir(uploadPathSb.toString());
		return uploadPathSb.toString();
	}

	public abstract Object getFileUploadDirectoryPath(String uploadMode, String uploadPath);

	public abstract String getFileMask(String originalFilename, int i, String uploadMode, String string);

	public abstract String getFileDownloadDirectoryPath(String maskingFileName, String uploadMode, String systemUploadPath);

	public abstract String getFileDownloadPullPath(String fileMask, String dbMode, String string);

	public JFile getJFile(JFileDetails fileVo, String useSecurity, String uploadPath) {
		if (fileVo == null) {
			throw new JFileException(" 첨부파일 이력 정보가 존재하지 않습니다. ");
		}

		LOGGER.debug("Server Repository Path : {}", getFileDownloadPullPath(fileVo.getFileMask(), fileVo.getUploadMode(), uploadPath));

		JFile jfile = new JFile(getFileDownloadPullPath(fileVo.getFileMask(), fileVo.getUploadMode(), uploadPath));
		jfile.setOriginalFileName(fileVo.getFileName());
		//		jfile.setUseSecurity(fileVo.getUseSecurity());
		jfile.setUseSecurity(useSecurity);
		
		return jfile;
	}

	public JFile[] getFiles(List<JFileDetails> files, String uploadPath, String useSecurity, String uploadMode) {
		if (files == null)
			return null;

		JFile[] jfiles = new JFile[files.size()];
		int idx = 0;

		for (JFileDetails file : files) {
			if (file == null)
				throw new JFileException(" FileUpload 이력 정보가 존재하지 않습니다. ");

			LOGGER.debug("Server Repository Path : {}",
					getFileDownloadPullPath(file.getFileMask(), uploadMode, uploadPath == null ? JProperties.getString(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY) : uploadPath));

			JFile jfile = new JFile(getFileDownloadPullPath(file.getFileMask(), uploadMode,
					uploadPath == null ? JProperties.getString(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY) : uploadPath));
			jfile.setOriginalFileName(file.getFileName());
			jfile.setUseSecurity(useSecurity);
			jfiles[idx] = jfile;
			idx++;
		}
		
		return jfiles;
	}

	public void deleteJFiles(JFileDetails details, String uploadPath, String uploadMode) {
		if (details == null) {
			return;
		}

		/** 파일을 삭제한다. */
		deleteFileByFullPath(getFileUploadDirectoryPath(uploadMode, uploadPath) + details.getFileMask());
	}

	/**
	 * 파일업로드 이벤트 리스너를 반환한다.
	 * @return FileUploadEventListener 파일업로드 이벤트 리스너.
	 */
	public Collection<FileUploadCompletedEventListener> getFileUploadCompletedEventListener() {
		return fileUploadCompletedEventListeners;
	}

	/**
	 * 파일업로드 이벤트 리스너를 세팅한다.
	 * @param fileUploadEventListener 파일업로드 이벤트 리스너.
	 */
	public void setFileUploadCompletedEventListener(FileUploadCompletedEventListener fileUploadListener) {
		if (fileUploadCompletedEventListeners == null) {
			fileUploadCompletedEventListeners = new ArrayList<FileUploadCompletedEventListener>();
		}
		fileUploadCompletedEventListeners.add(fileUploadListener);
	}

	public void upload(MultipartFile multipartFile, JFileDetails fileVo) {

		fileVo.setFileMask(getFileMask(multipartFile.getOriginalFilename(), 0, fileVo.getUploadMode(), JProperties.getString(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY)));
		fileVo.setFileName(multipartFile.getOriginalFilename());
		fileVo.setFileSize(multipartFile.getSize());
		String uploadDirectoryPath = getUploadDirectoryPath(JProperties.getString(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY), fileVo.getUploadMode());
		String uploadPullPath = getUploadFilePullPath(
				fileVo.getFileMask(),
				fileVo.getUploadMode(),
				(getUploadPathKey() != null && !"".equals(getUploadPathKey())) ? JProperties.getString(getUploadPathKey()) : JProperties
						.getString(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY));
		try {
			JFileUploadTypeFactory.INSTANCE.getUploadType(fileVo.getUseSecurity()).getHandler().handle(multipartFile.getInputStream(), new FileOutputStream(uploadPullPath));
			if (getFileUploadCompletedEventListener() != null) {
				for (FileUploadCompletedEventListener listener : getFileUploadCompletedEventListener()) {
					listener.uploadCompleted(fileVo.getFileId(), uploadDirectoryPath, fileVo.getFileMask(), multipartFile.getOriginalFilename());
				}
			}
		} catch (IOException e) {
			throw new JFileException(e);
		} catch (Exception e) {
			throw new JFileException(e);
		}
		LOGGER.debug("\n================Upload Completed====================\n UPLOAD PATH : {} \n UPLOAD File : {} \n", uploadDirectoryPath, multipartFile.getOriginalFilename());
	}

	/**
	 * 프로퍼티 파일에 정의된 uploadpath 키를 반환
	 * @return String 프로퍼티 파일에 정의된 uploadpath 키
	 */
	public String getUploadPathKey() {
		return uploadPathKey;
	}

	/**
	 * 프로퍼티 파일에 정의된 uploadpath 키를 세팅
	 * @param uploadPathKey 프로퍼티 파일에 정의된 uploadpath 키
	 */
	public void setUploadPathKey(String uploadPathKey) {
		this.uploadPathKey = uploadPathKey;
	}

	/**
	 * 입력받은 디렉터리가 존재 하지 않았다면 경로를 생성 한후 파일을 생성한다.
	 * @param file 파일 객체.
	 */
	protected void mkdir(File file) {
		if (!file.exists())
			//2017.02.07 	이정은 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			if(file.mkdirs()){
				LOGGER.debug("[file.mkdirs] file : Creation Success");
			}else{				
				LOGGER.error("[file.mkdirs] file : Creation Fail");
			}
	}

	/**
	 * 입력받은 디렉터리가 존재 하지 않았다면 경로를 생성 한후 파일을 생성한다.
	 * @param fullpath 파일 경로.
	 */
	protected void mkdir(String fullpath) {
		File file = new File(fullpath);
		if (!file.exists())
			//2017.02.07 	이정은 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			if(file.mkdirs()){
				LOGGER.debug("[file.mkdirs] file : Creation Success");
			}else{				
				LOGGER.error("[file.mkdirs] file : Creation Fail");
			}
	}

	/**
	 * 파일경로에 파일이 존재하면 삭제한다.
	 * @param fullPath 파일경로.
	 */
	public void deleteFileByFullPath(String fullPath) {
		File f = null;
		f = new File(fullPath);
		if (f.exists()) {
			//2017.02.07 	이정은 	시큐어코딩(ES)-부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
			if(f.delete()){
				LOGGER.debug("[file.delete] file : File Path Deletion Success");
			}else{				
				LOGGER.error("[file.delete] file : File Path Deletion Fail");
			}
		}
	}

	/**
	 * 암호화 서비스 객체를 반환한다.
	 * @return CipherService 암호화 서비스 객체.
	 */
	public CipherService getCipherService() {
		return cipherService;
	}

	/**
	 * 암호화 서비스 객체를 반환한다.
	 * @param cipherService 암호화 서비스 객체.
	 */
	public void setCipherService(CipherService cipherService) {
		this.cipherService = cipherService;
	}
}
