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
package egovframework.com.ext.jfile.service.template;

import egovframework.com.ext.jfile.utils.DateUtils;
import egovframework.com.ext.jfile.utils.KeyHelper;

import org.springframework.stereotype.Service;

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
@Service
public class DBUploadModeTemplate extends JFileUploadModeTemplate {

    /**
     * 파일명은 포함하지 않은 폴더 경로. 
     * 예) C:/test/
     * @param uploadMode.
     * @param filePath.
     * @return String 폴더 패스.
     */
    public String getFileUploadDirectoryPath(String uploadMode, String filePath) {		
    	return new StringBuilder().append(filePath)
			.append(java.io.File.separator)
			.append(DateUtils.getSysDate("yyyyMM"))
			.append(java.io.File.separator)
			.append(DateUtils.getSysDate("dd"))
			.append(java.io.File.separator).toString();
	}

	/**
	 * 마스킹 된 파일명을 반환한다.
	 * @param filename 파일명.
	 * @param idx 인덱스.
	 * @param uploadMode 업로드 모드.
	 * @param upload 업로드 경로.
	 * @return String 마스킹 된 파일명.
	 */
	public String getFileMask(String filename, int idx, String uploadMode, String upload) {
		return DateUtils.getSysDate() + KeyHelper.getStringKey() + idx;
	}
    
    /**
     * 서버에 저장된 파일의 전체경로를 반환한다.
     * @param maskingName 마스킹 된 파일.
     * @param uploadMode 업로드 모드.
     * @param systemUploadPath 업로드 된 서버 파일경로.
     * @return String 디렉터리 경로를 포함한 파일경로.
     */
	public String getFileDownloadPullPath(String maskingName, String uploadMode, String systemUploadPath) {
		return new StringBuilder().append(getFileDownloadDirectoryPath(maskingName, uploadMode, systemUploadPath)).append(maskingName).toString();
	}
	
	/**
	 * 서버에 저장된 파일의 디렉터리를 반환한다.
	 * @param maskingFileName 마스킹 된 파일명.
	 * @param uploadMode 업로드 모드. 
	 * @param systemUploadPath 업로드 된 서버 파일경로.
	 * @return String 디렉터리 경로.
	 */
	public String getFileDownloadDirectoryPath(String maskingFileName, String uploadMode, String systemUploadPath) {
		return new StringBuilder().append(systemUploadPath)
		.append(java.io.File.separator)
		.append(maskingFileName.substring(0, 6))
		.append(java.io.File.separator)
		.append(maskingFileName.substring(6,8))
		.append(java.io.File.separator).toString();
	}
}
