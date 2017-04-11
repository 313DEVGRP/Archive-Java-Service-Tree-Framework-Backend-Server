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
public class FileDownloadTag extends TagSupport {
	
	/** 디폴트로 생성한 시리얼 UID */
	private static final long serialVersionUID = -4499348786445975101L;
	
	/** 객체 아이디 */
	private String objectId;
	
	/** 파일 아이디 */
	private String fileId;
	
	/** 미리보기 여부 */
	private String usePreview;

	/** Jfile upload 를 처리하기위한 HttpServletRequest 로 넘어오는 빈 아이디 Key 값 */
	private String beanId;
	
	/** Jfile upload 를 처리하기위한 properties 에 정의한 key 값 */
	private String uploadPathKey;
	
	/** 보안 적용 암호화 여부 */
	private String useSecurity;
	
	/** 업로드 모드 */
	private String uploadMode;
	
	/**
	 * 입력받은 정보를 참조하여 태그를 생성한다.
	 */
	public int doStartTag() throws JspException {
		try {
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			StringBuilder bf = new StringBuilder()
            .append("<script>")
            .append("var "+getObjectId()+";")
            .append("jQuery(document).ready(function() {")
            .append(getObjectId()+"= new jwork.fileDownload( \""+getObjectId()+"\", \""+request.getContextPath()+"\", \""+getFileId()+"\", {usePreview:" + getUsePreview() + ", uploadMode: \""+getUploadMode()+"\", beanId:\""+getBeanId()+"\", useSecurity:"+getUseSecurity()+" });")
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
	 * 객체 아이디를 반환
	 * @return String 객체 아이디
	 */
	public String getObjectId() {
		return objectId;
	}

	/**
	 * 객체 아이디를 세팅
	 * @param objectId 객체 아이디
	 */
	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	/**
	 * 파일 아이디를 반환.
	 * @return String 파일아이디.
	 */
	public String getFileId() {
		return fileId;
	}

	/**
	 * 파일 아이디를 세팅
	 * @param fileId 파일 아이디
	 */
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	/**
	 * 미리보기 여부를 반환
	 * @return String 미리보기 
	 */
	public String getUsePreview() {
		return usePreview;
	}

	/**
	 * 미리보기 여부를 세팅
	 * @param usePreview 미리보기 여부
	 */
	public void setUsePreview(String usePreview) {
		this.usePreview = usePreview;
	}
	
	/**
	 * request 로 넘어오는 다운로드 서비스 빈 아이디 값을 반환한다.
	 * @return String 다운로드 서비스 아이디
	 */
	public String getBeanId() {
		return beanId;
	}

	/**
	 * request 로 넘어오는 다운로드 서비스 빈 아이디 값을 세팅한다.
	 * @param downloadServiceId 다운로드 서비스 아이디 
	 */
	public void setBeanId(String downloadServiceId) {
		this.beanId = downloadServiceId;
	}

	/**
	 * 입력받은 객체를 release 한다.
	 */
	public void release() {
		super.release();
		fileId = null;
		objectId = null;
		usePreview = null;
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
	 * 보안 적용 암호화 여부 값을 반환
	 * @return String 보안 적용 암호화 여부 값
	 */
	public String getUseSecurity() {
		return useSecurity;
	}

	/**
	 * 보안 적용 암호화 여부 값을 세팅
	 * @param useSecurity 보안 적용 암호화 여부 값 
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
