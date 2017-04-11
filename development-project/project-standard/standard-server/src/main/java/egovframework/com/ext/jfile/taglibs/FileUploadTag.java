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
package egovframework.com.ext.jfile.taglibs;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

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
 * </pre>
 */
public class FileUploadTag extends TagSupport {

	/** 디폴트로 생성한 시리얼 UID */
	private static final long serialVersionUID = 6690756707645416780L;
	
	/** 최대 파일 사이즈 */
	private String maxFileSize;
	
	/** 최대 파일 갯수 */
	private String maxFileCount;
	
	/** 업로드 완료 이벤트 명 */
	private String uploadCompletedEvent;
	
	/** 파일 타입 */
	private String fileType;
	
	/** 파일 아이디 */
	private String fileId;
	
	/** 객체 아이디 */
	private String objectId;
	
	/** 미리보기 여부 */
	private String usePreview;
	
	/** Jfile upload 를 처리하기위한 HttpServletRequest 로 넘어오는 빈 아이디 Key 값 */
	private String beanId;
	
	/** Jfile upload 를 처리하기위한 properties 에 정의한 key 값 */
	private String uploadPathKey;
	
	/** 보안 적용 암호화 적용 여부 */
	private String useSecurity;
	
	/** 업로드 모드 */
	private String uploadMode;
	
	/**
	 * 디폴트 생성자.
	 */
	public FileUploadTag() {
		fileId               = null;
		objectId             = null;
		uploadCompletedEvent = null;
		maxFileSize          = "10";
		maxFileCount         = "10";		
		fileType             = "all";
		usePreview           = "false";
		useSecurity          = "false";
	}
	
	/**
	 * 입력받은 정보를 참조하여 태그를 생성한다.
	 */
	public int doStartTag()	throws JspException {
		try {
            HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
            StringBuilder bf = new StringBuilder()
            .append("<script>")
            .append("var "+getObjectId()+";")
            .append("jQuery(document).ready(function() {")
            .append(getObjectId()+"= new jwork.fileUpload( \""+getObjectId()+"\", \""+request.getContextPath()+"\", \""+getFileId()+"\", {maxFileSize: "+getMaxFileSize()+", uploadCompleted:"+getUploadCompletedEvent()+", beanId:\""+getBeanId()+"\", fileType:\""+getFileType()+"\", uploadMode:\""+getUploadMode()+"\", maxFileCount:"+getMaxFileCount()+", usePreview:" + getUsePreview() + ", useSecurity:"+getUseSecurity()+" });")
			.append("});")
            .append("</script>")
            .append("<div id=\""+getObjectId()+"\"></div>");                        
            pageContext.getOut().print(bf.toString());
        } catch(IOException ioe) {
        	throw new JspTagException("Error:  IOException while writing to the user");
        } catch(Exception e) {
        	throw new JspTagException("Error:  Exception while writing to the user" +e.getMessage() );
        }
        return SKIP_BODY;
	}
	
	/**
	 * 입력받은 객체를 release 한다.
	 */	
	public void release() {
		super.release();
		maxFileSize = null;
		maxFileCount = null;
		uploadCompletedEvent = null;
		fileType = null;
		fileId = null;
		objectId = null;
		usePreview = null;
	}
	
	/**
	 * 최대 파일 사이즈를 반환한다.
	 * @return String 최대파일사이즈. 
	 */
	public String getMaxFileSize() {
		return maxFileSize;
	}
	
	/**
	 * 최대 파일 사이즈를 세팅한다.
	 * @param maxFileSize 최대 파일 사이즈
	 */
	public void setMaxFileSize(String maxFileSize) {
		this.maxFileSize = maxFileSize;
	}
	
	/**
	 * 최대 파일 갯수를 반환한다.
	 * @return String 
	 */
	public String getMaxFileCount() {
		return maxFileCount;
	}
	
	/**
	 * 최대 파일 갯수를 세팅한다.
	 * @param maxFileCount 최대 파일 갯수
	 */
	public void setMaxFileCount(String maxFileCount) {
		this.maxFileCount = maxFileCount;
	}
	
	/**
	 * 업로드 완료 이벤트 명을 반환한다.
	 * @return String 업로드 완료 이벤트 명
	 */
	public String getUploadCompletedEvent() {
		return uploadCompletedEvent;
	}
	
	/**
	 * 업로드 완료 이벤트 명을 세팅한다.
	 * @param uploadCompletedEvent 업로드 완료 이벤트명
	 */
	public void setUploadCompletedEvent(String uploadCompletedEvent) {
		this.uploadCompletedEvent = uploadCompletedEvent;
	}
	
	/**
	 * 파일 타입을 반환한다.
	 * @return 파일타입.
	 */
	public String getFileType() {
		return fileType;
	}
	
	/**
	 * 파일 타입을 세팅한다.
	 * @param fileType 파일 타입.
	 */
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	/**
	 * 파일 아이디를 반환한다.
	 * @return 파일아이디.
	 */
	public String getFileId() {
		return fileId;
	}
	
	/**
	 * 파일 아이디를 세팅한다.
	 * @param fileId 파일 아이디
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	
	/**
	 * 객체 아이디를 세팅한다.
	 * @return 객체 아이디
	 */
	public String getObjectId() {
		return objectId;
	}
	
	/**
	 * 객체 아이디를 세팅한다.
	 * @param objectId 객체 아이디
	 */
	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}
	
	/**
	 * 미리보기 여부를 반환한다.
	 * @return String 미리보기 여부
	 */
	public String getUsePreview() {
		return usePreview;
	}
	
	/**
	 * 미리보기 여부를 세팅한다.
	 * @param usePreview 미리보기 여부
	 */
	public void setUsePreview(String usePreview) {
		this.usePreview = usePreview;
	}

	/**
	 * request 로 넘어오는 업로드 서비스 빈 아이디 값을 반환한다.
	 * @return String 서비스 빈 아이디 값 
	 */
	public String getBeanId() {
		return beanId;
	}

	/**
	 * request 로 넘어오는 업로드 서비스 빈 아이디 값을 세팅한다.
	 * @param uploadServiceId 서비스 빈 아이디 값
	 */
	public void setBeanId(String beanId) {
		this.beanId = beanId;
	}

	/**
	 * properties 파일에 정의한 업로드 키 값을 반환
	 * @return String properties 파일에 정의한 업로드 키 값
	 */
	public String getUploadPathKey() {
		return uploadPathKey;
	}

	/**
	 * properties 파일에 정의한 업로드 키 값을 세팅
	 * @param uploadPathKey
	 */
	public void setUploadPathKey(String uploadPathKey) {
		this.uploadPathKey = uploadPathKey;
	}

	/**
	 * 보안 적용 암호화 적용 여부 값을 반환
	 * @return String 보안 적용 암호화 적용 여부 값 
	 */
	public String getUseSecurity() {
		return useSecurity;
	}

	/**
	 * 보안 적용 암호화 적용 여부 값을 세팅
	 * @param useSecurity
	 */
	public void setUseSecurity(String useSecurity) {
		this.useSecurity = useSecurity;
	}

	/**
	 * 업로드 모드를 반환한다.
	 * @return String 업로드 모드
	 */
	public String getUploadMode() {
		return uploadMode;
	}

	/**
	 * 업로드 모드를 세팅한다.
	 * @param uploadMode 업로드 모드
	 */
	public void setUploadMode(String uploadMode) {
		this.uploadMode = uploadMode;
	}
}
