package egovframework.com.ext.jstree.springmyBatis.core.util;

/**
 * Modification Information
 * 
 * @author ?
 * @since 2014. 7. 31.
 * @version 1.0
 * @see <pre>
 * 	Class Name 	: Util_TitleChecker.java
 * 	Description : 제목을 체크하기위한 유틸 클래스
 * 	Infomation	: StringReplace 메서드를 이용하여 특수문자를 공백으로 제거한다.
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014. 7. 31.       ?          최초 생성
 * 
 *  Copyright (C) 2014 by 313 DeveloperGroup  All right reserved.
 * </pre>
 */
public class Util_TitleChecker {

	/**
	 * 특수문자를 찾아서 공백으로 변경한다.
	 * 
	 * @param String 비교할 스트링
	 * @return String 특수문자가 공백으로 변경된 String
	 */
	public static String StringReplace(String str) {
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		str = str.replaceAll(match, " ");
		return str;
	}
}