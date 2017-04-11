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
package egovframework.com.ext.jfile.session;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SessionUploadChecker {

	private static final Logger LOGGER = LoggerFactory.getLogger(SessionUploadChecker.class);

	public static ConcurrentHashMap<String, Boolean> sessionMap = new ConcurrentHashMap<String, Boolean>();

	public static void check(HttpServletRequest request, String fileId) {

		LOGGER.debug(new StringBuilder().append("\n").append("\n")
		.append("================== session upload check ==================").append("\n")
		.append(" jsessionid_fileId : ").append(request.getSession().getId()).append("\n")
		.append("==========================================================").append("\n")
		.toString());
		sessionMap.put(request.getSession().getId()+"_"+fileId, true);

	}

	public static void unCheck(HttpServletRequest request, String fileId) {

		LOGGER.debug(new StringBuilder().append("\n").append("\n")
		.append("================= session upload uncheck =================").append("\n")
		.append(" jsessionid_fileId : ").append(request.getSession().getId()).append("\n")
		.append("==========================================================").append("\n")
		.toString());

		if(sessionMap.containsKey(request.getSession().getId()+"_"+fileId)) {
			sessionMap.remove(request.getSession().getId()+"_"+fileId);
		}
	}

	public static boolean isContainsKey(HttpServletRequest request, String fileId) {
		return sessionMap.containsKey(request.getSession().getId()+"_"+fileId);
	}
}
