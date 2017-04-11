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
package egovframework.com.ext.jfile;

import egovframework.com.cmm.service.EgovProperties;

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
 *   2013.12.19	표준프레임워크	공통컴포넌트 추가 적용 (패키지 변경 및 속성 처리)
 * </pre>
 */
public class JProperties {
	
	/*
	private static final Map<String, String> GLOVAL_VARIABLES_MAP = new HashMap<String, String>() {{
		put(GlobalVariables.DEFAULT_FILE_UPLOAD_PATH_KEY, "c:\\projects\\temp");
		put(GlobalVariables.DEFAULT_NO_IMAGE_APP_PATH_KEY, "/resources/swfupload/images/no_img.gif");
		put(GlobalVariables.FTP_SERVER_IP, "192.168.11.55");
		put(GlobalVariables.FTP_USER_ID, "test1");
		put(GlobalVariables.FTP_USER_PASSWORD, "test1");
	}}; 
	
	public static final String getString(String key) {
		return GLOVAL_VARIABLES_MAP.get(key);
	}
	*/
	
	public static final String getString(String key) {
		return EgovProperties.getProperty(key);
	}
}
