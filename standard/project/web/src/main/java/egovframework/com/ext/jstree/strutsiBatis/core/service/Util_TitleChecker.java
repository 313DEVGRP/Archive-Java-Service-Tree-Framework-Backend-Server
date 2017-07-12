package egovframework.com.ext.jstree.strutsiBatis.core.service;

/**
 * Modification Information
 * 
 * @author 이동민
 * @since 2014.07.25
 * @version 1.0
 * @see <pre>
 * 
 * Class Name 	: Util_TitleChecker.java
 * Description 	: data의 검증을 위한 utill 클래스
 * Infomation	: 
 * 
 * 클래스 이름이 조금 의미를 벗어난거 같다.
 *  
 *  << 개정이력(Modification Information) >>
 *  
 *  수정일         수정자             수정내용
 *  -------      ------------   -----------------------
 *  2014.07.25    Dongmin.Lee      최초 생성 
 * 
 *  Copyright (C) 2007 by 313 DeveloperGroup  All right reserved.
 * </pre>
 * */
public class Util_TitleChecker {
	
	/**
	 * 
	 * 데이터에 포함된 특수문자 제거
	 * 
	 * @param String 
	 * @return String
	 * */
	public static String StringReplace(String str) {
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		str = str.replaceAll(match, " ");
		return str;
	}

}
