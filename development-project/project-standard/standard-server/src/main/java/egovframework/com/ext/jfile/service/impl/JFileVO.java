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
package egovframework.com.ext.jfile.service.impl;

import java.util.Date;

import egovframework.com.ext.jfile.service.JFileDetails;

public class JFileVO implements JFileDetails {
	
	private String fileId = null; 
	 
	private String fileSeq = null; 
 
	private String fileName = null; 
 
	private long fileSize = -1; 

	private String fileMask = null; 
 
	private String downloadCount = null; 
 
	private Date downloadExpireDate = null; 
 
	private String downloadLimitCount = null; 
 
	private Date regDate = null; 
	
	private String useSecurity = null;
	
	private String uploadMode = "db";		
 
	/**
	 * @return fileId 파일 아이디
	 */
	public String getFileId() { 
		return fileId; 
	}	 
	/**
	 * @return fileSeq 파일 순번
	 */
	public String getFileSeq() { 
		return fileSeq; 
	}	 
	/**
	 * @return fileName 파일명
	 */
	public String getFileName() { 
		return fileName; 
	}	 

	/**
	 * @return fileSize 파일 사이즈
	 */
	public long getFileSize() { 
		return fileSize; 
	}	 
	/**
	 * @return fileMask 파일 마스크
	 */
	public String getFileMask() { 
		return fileMask; 
	}	 
 
	/**
	 * @return downloadCount 다운로드 카운트
	 */
	public String getDownloadCount() { 
		return downloadCount; 
	}	 
	
	/**
	 * @return downloadExpireDate 다운로드 만료일
	 */
	public Date getDownloadExpireDate() { 
		return downloadExpireDate; 
	}	 
	
	/**
	 * @return downloadLimitCount 다운로드 제한 횟수
	 */
	public String getDownloadLimitCount() { 
		return downloadLimitCount; 
	}	 
	
	/**
	 * @return regDate 등록일자
	 */
	public Date getRegDate() { 
		return regDate; 
	}	 

	/**
	 * @param fileId 파일 아이디
	 */
	public void setFileId( String fileId) { 
		this.fileId = fileId; 
	} 
	/**
	 * @param fileSeq 파일 순번
	 */
	public void setFileSeq( String fileSeq) { 
		this.fileSeq = fileSeq; 
	} 
	/**
	 * @param fileSeq 파일명
	 */

	public void setFileName( String fileName) { 
		this.fileName = fileName; 
	} 

	/**
	 * @param fileSize 파일 사이즈
	 */
	public void setFileSize( long fileSize) { 
		this.fileSize = fileSize; 
	} 
	/**
	 * @param fileSize 파일 마스킹
	 */

	public void setFileMask( String fileMask) { 
		this.fileMask = fileMask; 
	} 

	/**
	 * @param downloadCount 다운로드 횟수
	 */

	public void setDownloadCount( String downloadCount) { 
		this.downloadCount = downloadCount; 
	} 
	
	/**
	 * @param downloadExpireDate 다운로드 만료일
	 */
	public void setDownloadExpireDate( Date downloadExpireDate) { 
		this.downloadExpireDate = downloadExpireDate; 
	} 

	/**
	 * @param downloadLimitCount 다운로드 제한 횟수
	 */
	public void setDownloadLimitCount( String downloadLimitCount) { 
		this.downloadLimitCount = downloadLimitCount; 
	} 

	/**
	 * @param regDate 등록일자
	 */
	public void setRegDate( Date regDate) { 
		this.regDate = regDate; 
	}
	public String getUseSecurity() {
		return useSecurity;
	}
	public void setUseSecurity(String useSecurity) {
		this.useSecurity = useSecurity;
	}
	public String getUploadMode() {
		return uploadMode;
	}
	public void setUploadMode(String uploadMode) {
		this.uploadMode = uploadMode;
	} 
	
	public boolean isImage() {
		return 	("bmp". equals(getExtension()) ||
			     "gif". equals(getExtension()) ||
		         "jpg". equals(getExtension()) ||
		         "jpeg".equals(getExtension()) ||
		         "png". equals(getExtension())
		) ;
	}

	public String getExtension() {
		if(fileName == null)
			return null;
		return  fileName.lastIndexOf(".") > -1 ? fileName.substring(fileName.lastIndexOf(".")+1) : null; 
	}
}
