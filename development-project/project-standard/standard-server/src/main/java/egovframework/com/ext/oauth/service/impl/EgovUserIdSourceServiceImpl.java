/*
 * eGovFrame OAuth
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
 * @author 이기하(슈퍼개발자K3)
 */
package egovframework.com.ext.oauth.service.impl;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.springframework.social.UserIdSource;
import org.springframework.stereotype.Service;

/**
 * 사용자Id를 받아서 반환하는 비즈니스 구현 클래스
 * @author 이기하
 * @since 2014.10.08
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일     	수정자          수정내용
 *  -----------    --------    ---------------------------
 *  2014.10.08		이기하          최초 생성
 *  </pre>
 */

@Service("userIdSource")
public class EgovUserIdSourceServiceImpl extends EgovAbstractServiceImpl implements UserIdSource {

	/**
	 * 사용자Id를 받아서 반환한다
	 * @return user.getId()
	 */
	@Override
	public String getUserId() {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		return user.getId();
	}
}
