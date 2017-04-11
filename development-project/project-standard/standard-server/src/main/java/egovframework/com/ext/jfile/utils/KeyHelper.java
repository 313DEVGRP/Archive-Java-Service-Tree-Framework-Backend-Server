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
package egovframework.com.ext.jfile.utils;

import java.util.Random;

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
public abstract class KeyHelper {
	
	/** 키 생성기 */
	private static KeyGenerator keyGenerator = new KeyGenerator();
	
	/** String 으로 생성된 13 자리 문자열을 반환한다. */
	public static String getStringKey() {
		return keyGenerator.getStringKey();
	}
	
	/** 키 생성 클래스 */
	public static class KeyGenerator {
		
		public String getStringKey() {
			Random ran = new Random();
			String key = Long.toHexString(System.currentTimeMillis()) + "" + ran.nextInt(99);
			return key;	
		}
	}

}