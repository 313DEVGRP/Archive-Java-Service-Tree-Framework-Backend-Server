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

import java.text.SimpleDateFormat;
import java.util.Date;

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
public abstract class DateUtils {
	
	/**
	 * 현재 날짜를 yyyyMMdd 포맷으로 반환.
	 * @return String 현재 날짜.
	 */
	public static String getSysDate() {
		return getSysDate("yyyyMMdd");
	}
	
	/**
	 * 날짜 입력양식을 전달받아 현재 날짜를 반환.
	 * @param pattern 입력 양식.
	 * @return String 날짜 입력 양식.
	 */
	public static String getSysDate(String pattern) {
		return getDateString(new Date(), pattern);
	}
	
	/**
	 * Date 객체와 입력양식을 전달받아 날짜를 반환.
	 * @param date Date 객체.
	 * @param pattern 입력 양식.
	 * @return String 날짜.
	 */
	public static String getDateString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
	
	/**
	 * 숫자형태의 시간과 포맷을 전달받아 날짜를 반환.
	 * @param time 숫자형태의 시간
	 * @param pattern 시간 포맷
	 * @return String 날짜
	 */
	public static String getDateString(long time, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date d = new Date(time);
		return sdf.format(d);
	}
}
