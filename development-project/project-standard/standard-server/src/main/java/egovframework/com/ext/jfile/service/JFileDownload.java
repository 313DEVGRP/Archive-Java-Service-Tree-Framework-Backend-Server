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
package egovframework.com.ext.jfile.service;

import java.io.File;

public interface JFileDownload {

	/**
	 * 첨부파일 객체.
	 * @param fileId 파일 아이디.
	 * @return File 파일 객체.
	 */
	public File getFileBySequence(String fileId, String useSecurity);
	
	/**
	 * 첨부파일 객체.
	 * @param fileId 파일 아이디.
	 * @param fileSeq 파일 시퀀스 목록.
	 * @return File 파일 객체. 
	 */
	public File getFileBySequence(String fileId, String fileSeq, String useSecurity);
		
	/**
	 * JFile 객체
	 * @param fileId 파일 아이디.
	 * @return JFile[] 암호화 정보 및 마스킹 파일명을 포함하고 있는 파일 객체.
	 */
	public JFile[] getFiles(String fileId, String useSecurity);
	
	/**
	 * JFile 객체
	 * @param fileId 파일 아이디
	 * @param uploadPath 파일 경로
	 * @return JFile[] 암호화 정보 및 마스킹 파일명을 포함하고 있는 파일 객체
	 */
	public JFile[] getFiles(String fileId, String uploadPath, String useSecurity);
	
}
