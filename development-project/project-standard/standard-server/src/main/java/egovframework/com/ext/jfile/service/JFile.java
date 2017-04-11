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

import egovframework.com.ext.jfile.security.service.CipherService;

public class JFile extends File {

	private static final long serialVersionUID = -1250777584171760029L;

	private CipherService cipherService;
	
	private String originalFileName;
	
	private String useSecurity;
	
	public JFile(String pathname) {
		super(pathname);
	}	
	
	public String getUseSecurity() {
		return useSecurity;
	}

	public void setUseSecurity(String useSecurity) {
		this.useSecurity = useSecurity;
	}

	public JFile(String pathname, CipherService cipherService) {
		super(pathname);
		this.cipherService = cipherService;
	}

	public CipherService getCipherService() {
		return cipherService;
	}

	public void setCipherService(CipherService cipherService) {
		this.cipherService = cipherService;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	
}

