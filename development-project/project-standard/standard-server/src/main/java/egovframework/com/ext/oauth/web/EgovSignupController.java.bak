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
package egovframework.com.ext.oauth.web;

import egovframework.com.ext.oauth.service.EgovSignupService;
import egovframework.com.utl.fcc.service.EgovStringUtil;

import javax.annotation.Resource;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

/**
 * 소셜 계정으로 일반회원 가입을 처리하는 컨트롤러 클래스
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

@Controller
public class EgovSignupController {

	@Resource(name="signupService")
	private EgovSignupService signupService;

	private final ProviderSignInUtils providerSignInUtils;

	public EgovSignupController() {
		this.providerSignInUtils = new ProviderSignInUtils();
	}

	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signupForm(WebRequest request) throws Exception {
		Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
		if (connection != null) {
			UserProfile profile = connection.fetchUserProfile();

			String key =  EgovStringUtil.remove(connection.getKey().toString(), ':');
			String account = signupService.signup(profile, request, key);
			if (account != null) {
				providerSignInUtils.doPostSignUp(key, request);
				return "redirect:/";
			}
		}
		return "redirect:/";
	}
}
