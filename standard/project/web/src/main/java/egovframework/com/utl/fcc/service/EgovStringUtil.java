package egovframework.com.utl.fcc.service;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class EgovStringUtil {
	public static final String EMPTY = "";

	public static String cutString(String source, String output, int slength) {
		String returnVal = null;
		if (source != null) {
			if (source.length() > slength) {
				returnVal = source.substring(0, slength) + output;
			} else
				returnVal = source;
		}
		return returnVal;
	}

	public static String cutString(String source, int slength) {
		String result = null;
		if (source != null) {
			if (source.length() > slength) {
				result = source.substring(0, slength);
			} else
				result = source;
		}
		return result;
	}

	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	public static String remove(String str, char remove) {
		if (isEmpty(str) || str.indexOf(remove) == -1) {
			return str;
		}
		char[] chars = str.toCharArray();
		int pos = 0;
		for (int i = 0; i < chars.length; i++) {
			if (chars[i] != remove) {
				chars[pos++] = chars[i];
			}
		}
		return new String(chars, 0, pos);
	}

	public static String removeCommaChar(String str) {
		return remove(str, ',');
	}

	public static String removeMinusChar(String str) {
		return remove(str, '-');
	}

	public static String replace(String source, String subject, String object) {
		StringBuffer rtnStr = new StringBuffer();
		String preStr = "";
		String nextStr = source;
		String srcStr = source;

		while (srcStr.indexOf(subject) >= 0) {
			preStr = srcStr.substring(0, srcStr.indexOf(subject));
			nextStr = srcStr.substring(srcStr.indexOf(subject) + subject.length(), srcStr.length());
			srcStr = nextStr;
			rtnStr.append(preStr).append(object);
		}
		rtnStr.append(nextStr);
		
		return rtnStr.toString();
	}

	public static String replaceOnce(String source, String subject, String object) {
		StringBuffer rtnStr = new StringBuffer();
		String preStr = "";
		String nextStr = source;
		if (source.indexOf(subject) >= 0) {
			preStr = source.substring(0, source.indexOf(subject));
			nextStr = source.substring(source.indexOf(subject) + subject.length(), source.length());
			rtnStr.append(preStr).append(object).append(nextStr);
			
			return rtnStr.toString();
		} else {
			return source;
		}
	}

	public static String replaceChar(String source, String subject, String object) {
		StringBuffer rtnStr = new StringBuffer();
		String preStr = "";
		String nextStr = source;
		String srcStr = source;

		char chA;

		for (int i = 0; i < subject.length(); i++) {
			chA = subject.charAt(i);

			if (srcStr.indexOf(chA) >= 0) {
				preStr = srcStr.substring(0, srcStr.indexOf(chA));
				nextStr = srcStr.substring(srcStr.indexOf(chA) + 1, srcStr.length());
				srcStr = rtnStr.append(preStr).append(object).append(nextStr).toString();
			}
		}

		return srcStr;
	}

	public static int indexOf(String str, String searchStr) {
		if (str == null || searchStr == null) {
			return -1;
		}
		
		return str.indexOf(searchStr);
	}

	public static String decode(String sourceStr, String compareStr, String returnStr, String defaultStr) {
		if (sourceStr == null && compareStr == null) {
			return returnStr;
		}

		if (sourceStr == null && compareStr != null) {
			return defaultStr;
		}

		if (sourceStr.trim().equals(compareStr)) {
			return returnStr;
		}

		return defaultStr;
	}

	public static String decode(String sourceStr, String compareStr, String returnStr) {
		return decode(sourceStr, compareStr, returnStr, sourceStr);
	}

	public static String isNullToString(Object object) {
		String string = "";

		if (object != null) {
			string = object.toString().trim();
		}

		return string;
	}

	public static String nullConvert(Object src) {
		//if (src != null && src.getClass().getName().equals("java.math.BigDecimal")) {
		if (src != null && src instanceof BigDecimal) {
			return ((BigDecimal) src).toString();
		}

		if (src == null || src.equals("null")) {
			return "";
		} else {
			return ((String) src).trim();
		}
	}
	
	public static String nullConvertInt(Object src) {
		//if (src != null && src.getClass().getName().equals("java.math.BigDecimal")) {
		if (src != null && src instanceof BigDecimal) {
			return ((BigDecimal) src).toString();
		}

		if (src == null || src.equals("null")) {
			return "0";
		} else {
			return ((String) src).trim();
		}
	}

	public static String nullConvert(String src) {

		if (src == null || src.equals("null") || "".equals(src) || " ".equals(src)) {
			return "";
		} else {
			return src.trim();
		}
	}

	public static int zeroConvert(Object src) {

		if (src == null || src.equals("null")) {
			return 0;
		} else {
			return Integer.parseInt(((String) src).trim());
		}
	}

	public static int zeroConvert(String src) {

		if (src == null || src.equals("null") || "".equals(src) || " ".equals(src)) {
			return 0;
		} else {
			return Integer.parseInt(src.trim());
		}
	}

	public static String removeWhitespace(String str) {
		if (isEmpty(str)) {
			return str;
		}
		int sz = str.length();
		char[] chs = new char[sz];
		int count = 0;
		for (int i = 0; i < sz; i++) {
			if (!Character.isWhitespace(str.charAt(i))) {
				chs[count++] = str.charAt(i);
			}
		}
		if (count == sz) {
			return str;
		}

		return new String(chs, 0, count);
	}

	public static String checkHtmlView(String strString) {
		String strNew = "";

		StringBuffer strTxt = new StringBuffer("");

		char chrBuff;
		int len = strString.length();

		for (int i = 0; i < len; i++) {
			chrBuff = (char) strString.charAt(i);

			switch (chrBuff) {
				case '<':
					strTxt.append("&lt;");
					break;
				case '>':
					strTxt.append("&gt;");
					break;
				case '"':
					strTxt.append("&quot;");
					break;
				case 10:
					strTxt.append("<br>");
					break;
				case ' ':
					strTxt.append("&nbsp;");
					break;
				//case '&' :
				//strTxt.append("&amp;");
				//break;
				default:
					strTxt.append(chrBuff);
			}
		}

		strNew = strTxt.toString();

		return strNew;
	}

	public static String[] split(String source, String separator) throws NullPointerException {
		String[] returnVal = null;
		int cnt = 1;

		int index = source.indexOf(separator);
		int index0 = 0;
		while (index >= 0) {
			cnt++;
			index = source.indexOf(separator, index + 1);
		}
		returnVal = new String[cnt];
		cnt = 0;
		index = source.indexOf(separator);
		while (index >= 0) {
			returnVal[cnt] = source.substring(index0, index);
			index0 = index + 1;
			index = source.indexOf(separator, index + 1);
			cnt++;
		}
		returnVal[cnt] = source.substring(index0);

		return returnVal;
	}

	public static String lowerCase(String str) {
		if (str == null) {
			return null;
		}

		return str.toLowerCase();
	}

	public static String upperCase(String str) {
		if (str == null) {
			return null;
		}

		return str.toUpperCase();
	}

	public static String stripStart(String str, String stripChars) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0) {
			return str;
		}
		int start = 0;
		if (stripChars == null) {
			while ((start != strLen) && Character.isWhitespace(str.charAt(start))) {
				start++;
			}
		} else if (stripChars.length() == 0) {
			return str;
		} else {
			while ((start != strLen) && (stripChars.indexOf(str.charAt(start)) != -1)) {
				start++;
			}
		}

		return str.substring(start);
	}

	public static String stripEnd(String str, String stripChars) {
		int end;
		if (str == null || (end = str.length()) == 0) {
			return str;
		}

		if (stripChars == null) {
			while ((end != 0) && Character.isWhitespace(str.charAt(end - 1))) {
				end--;
			}
		} else if (stripChars.length() == 0) {
			return str;
		} else {
			while ((end != 0) && (stripChars.indexOf(str.charAt(end - 1)) != -1)) {
				end--;
			}
		}

		return str.substring(0, end);
	}

	public static String strip(String str, String stripChars) {
		if (isEmpty(str)) {
			return str;
		}

		String srcStr = str;
		srcStr = stripStart(srcStr, stripChars);

		return stripEnd(srcStr, stripChars);
	}

	public static String[] split(String source, String separator, int arraylength) throws NullPointerException {
		String[] returnVal = new String[arraylength];
		int cnt = 0;
		int index0 = 0;
		int index = source.indexOf(separator);
		while (index >= 0 && cnt < (arraylength - 1)) {
			returnVal[cnt] = source.substring(index0, index);
			index0 = index + 1;
			index = source.indexOf(separator, index + 1);
			cnt++;
		}
		returnVal[cnt] = source.substring(index0);
		if (cnt < (arraylength - 1)) {
			for (int i = cnt + 1; i < arraylength; i++) {
				returnVal[i] = "";
			}
		}

		return returnVal;
	}

	public static String getRandomStr(char startChr, char endChr) {

		int randomInt;
		String randomStr = null;

		// 시작문자 및 종료문자를 아스키숫자로 변환한다.
		int startInt = Integer.valueOf(startChr);
		int endInt = Integer.valueOf(endChr);

		// 시작문자열이 종료문자열보가 클경우
		if (startInt > endInt) {
			throw new IllegalArgumentException("Start String: " + startChr + " End String: " + endChr);
		}

		// 랜덤 객체 생성
		SecureRandom rnd = new SecureRandom();

		do {
			// 시작문자 및 종료문자 중에서 랜덤 숫자를 발생시킨다.
			randomInt = rnd.nextInt(endInt + 1);
		} while (randomInt < startInt); // 입력받은 문자 'A'(65)보다 작으면 다시 랜덤 숫자 발생.

		// 랜덤 숫자를 문자로 변환 후 스트링으로 다시 변환
		randomStr = (char) randomInt + "";

		// 랜덤문자열를 리턴
		return randomStr;
	}

	public static String getEncdDcd(String srcString, String srcCharsetNm, String cnvrCharsetNm) {

		String rtnStr = null;

		if (srcString == null)
			return null;

		try {
			rtnStr = new String(srcString.getBytes(srcCharsetNm), cnvrCharsetNm);
		} catch (UnsupportedEncodingException e) {
			rtnStr = null;
		}

		return rtnStr;
	}

	public static String getSpclStrCnvr(String srcString) {

		String rtnStr = null;

		StringBuffer strTxt = new StringBuffer("");

		char chrBuff;
		int len = srcString.length();

		for (int i = 0; i < len; i++) {
			chrBuff = (char) srcString.charAt(i);

			switch (chrBuff) {
				case '<':
					strTxt.append("&lt;");
					break;
				case '>':
					strTxt.append("&gt;");
					break;
				case '&':
					strTxt.append("&amp;");
					break;
				default:
					strTxt.append(chrBuff);
			}
		}

		rtnStr = strTxt.toString();

		return rtnStr;
	}

	public static String getTimeStamp() {

		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		rtnStr = sdfCurrent.format(ts.getTime());

		return rtnStr;
	}

	public static String getHtmlStrCnvr(String srcString) {

		String tmpString = srcString;

		tmpString = tmpString.replaceAll("&lt;", "<");
		tmpString = tmpString.replaceAll("&gt;", ">");
		tmpString = tmpString.replaceAll("&amp;", "&");
		tmpString = tmpString.replaceAll("&nbsp;", " ");
		tmpString = tmpString.replaceAll("&apos;", "\'");
		tmpString = tmpString.replaceAll("&quot;", "\"");

		return tmpString;

	}

	public static String addMinusChar(String date) {
		if (date.length() == 8) {
			return date.substring(0, 4).concat("-").concat(date.substring(4, 6)).concat("-").concat(date.substring(6, 8));
		} else {
			return "";
		}
	}
}
