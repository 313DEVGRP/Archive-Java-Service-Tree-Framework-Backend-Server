package egovframework.api.arms.util;


import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;


public class StringUtility extends egovframework.com.ext.jstree.support.util.StringUtils {
	

	
	public static String nvl(String str, String defaultStr) {
        return str == null ? defaultStr : str ;
	}
	
	public static String[] nvl(String[] input) {
		  if(input == null) {
		   return new String[0];
		  }  
		  return input;
		 }
	
	public static String nvl2(String str, String defaultStr) {
        return str == null ? defaultStr : (str == (null))?defaultStr: (str == "null") ?defaultStr:(str == "(null)") ?defaultStr:str ;
	}
	
	
	
	public static String enterToBr(String str) {
		str = replaceString(str);
		return str == null ? "" : str.replaceAll("\n", " <br/>");
	}
	
	public static String enterToNull(String str) {
		return str == null ? "" : str.replaceAll("\n", "");
	}	
	
	public static String decode (String msg, String type) throws UnsupportedEncodingException {
		return URLDecoder.decode (msg, type);
	}
	
	/**
	 * toString();
	 * @param value
	 * @return
	 */
	public static String toString(int value) {
		try {
			return value+"";
		} catch (Exception e) {
			return "";
		}
	}
	
	public static int toInt(String value) {
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static long toLong(String value) {
		try {
			return Long.parseLong(value);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public static String lpad(int value, int length, String prefix) {
		try {
			StringBuilder sb = new StringBuilder();
			String castValue = value + "";

			for (int i = castValue.length(); i< length; i++) {
				sb.append(prefix);
			}
			sb.append(castValue);
			return sb.toString();
		} catch (Exception e) {
			return "";
		}
	}
	
	public static String rpad(int value, int length, String prefix) {
		try {
			StringBuilder sb = new StringBuilder();
			String castValue = value + "";
			sb.append(castValue);
			for (int i = castValue.length(); i< length; i++) {
				sb.append(prefix);
			}
			return sb.toString();
		} catch (Exception e) {
			return "";
		}
	}
	
	public static String cutText(String text, int length, String suffix) {
		StringBuffer sb = new StringBuffer();
		
		if (!text.isEmpty()) {
			if (text.length() > length) {
				sb.append(text.substring(0, length)).append(suffix);
			} else {
				sb.append(text);
			}
		} else {
			sb.append(text);
		}
		return sb.toString();
	}

	//String이 비었거나 null인지 검사
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	public static String replaceText(String text, String originTxt, String replaceTxt) {
		return text.replaceAll(originTxt, replaceTxt);
	}


	public static String replaceBrTag(String text) {
		return text.replaceAll("\\n", "<br/>");
	}
	
	public static String removeAllTag(String txt) {
        return txt.replaceAll("(?:<!.*?(?:--.*?--\\s*)*.*?>)|(?:<(?:[^>'\"]*|\".*?\"|'.*?')+>)","");
    }
	
	
	/**
	  *  get String of java.util.Map keys and values to log
	  */
	 public static String getDatasOfMap(Map map) {
	  StringBuffer buf = new StringBuffer();
	  buf.append("getDatasOfMap() =>");
	  Set set = map.keySet();
	  Iterator iter = set.iterator();
	  while(iter.hasNext()) {
	   String name = (String)iter.next();
	   String value = (String)map.get(name);
	   buf.append("[").append(name).append("|").append(value).append("]");
	  }
	  return buf.toString();  
	 }
	 
	
	public static boolean isNullCheck(String str) {
		boolean bool = false;
		
		if(str != null && !"".equals(str)) {
			bool = true;
		}
		
		return bool;
	}
	
	/**
	 * 검색 결과 날짜표기 MM/DD 
	 * @param value
	 * @return
	 */
	public static String historyDate(String value) {
		return !(nvl(value, "").length() == 0) && value.length() == 8 ? value = value.substring(4, 6) + "/" + value.substring(6, 8) : "";
	}
	
	
	/**
	 * 검색 결과 날짜표기 YYYY.MM.DD 
	 * @param value
	 * @return
	 */
	public static String historyDate2(String value) {
		return !(nvl(value, "").length() == 0) && value.length() == 8 ? value = value.substring(0, 4) + "." + value.substring(4, 6) + "." + value.substring(6, 8) : "";
	}	
	/**
	 * 콤마 추가
	 * @param data
	 * @return
	 */
	public static String addComma(long data) {
		
		return new DecimalFormat("#,###").format(data);
	}
	
	/**
	 * 해당 URL 의 HTML 코드를 String 으로 가져옴
	 * @param uri
	 * @return
	 */
	public static String getSource(String uri){
		String str=null;
		try {
			URL url = new URL( uri );
			URLConnection uc = url.openConnection();
			InputStream in = uc.getInputStream();
			int len = uc.getContentLength();
			byte buf[] = new byte[len];
			in.read(buf, 0, buf.length);
			str = new String(buf);
	    } catch (Exception e){
	    	e.printStackTrace();
	    }
	    return str;
	  }
	/**
	 * 길이체크
	 * @param min
	 * @param max
	 * @param str
	 * @return
	 */
	public static boolean chkLength (int min, int max, String str) {
		int len = str.length ();
		return len < min || len > max ;
	}
	/**
	 * 연속된 값 체크
	 * @param str
	 * @param cmpCnt
	 * @return
	 */
	public static boolean chkSer (String str, int cmpCnt) {
		ByteBuffer bf = ByteBuffer.wrap(str.getBytes());
		//연속된 개수
		int serCnt = 1;
		//첫번째 문자코드
		int curr = bf.get ();
		//에러 여부
		boolean flag = false;
		
		for (int i = bf.position(), last =  bf.capacity(); i < last; i += 1) {
			//임시 변수
			int tmp = bf.get();
			//첫번째 문자와 현재 문자의 차이가 1이면
			if ( Math.abs(curr - tmp) == 1 ) {
				//연속 카운트 1증가
				serCnt += 1;
			} else {
				//카운트 리셋
				serCnt = 1;
			}
			//숫자 변경
			curr = tmp;
			//연속횟수가 설정한 값과 같다면 종료
			/*if ( (flag = serCnt == cmpCnt) ) {
				break;
			}*/
			if ( serCnt == cmpCnt ) {
				return flag; 
			}
		}
		return flag;
	}
	/**
	 * 반복값 체크
	 * @param str
	 * @param cmpCnt
	 * @return
	 */
	public static boolean chkRpt (String str, int cmpCnt) {
		ByteBuffer bf = ByteBuffer.wrap(str.getBytes());
		//반복된 개수
		int rptCnt = 1;
		//첫번째 문자코드
		int curr = bf.get ();
		//에러 여부
		boolean flag = false;
		
		for (int i = bf.position(), last = bf.capacity(); i < last; i += 1) {
			//임시 변수
			int tmp = bf.get();
			//첫번째 문자와 현재 문자의 차이가 1이면
			if ( curr == tmp ) {
				//연속 카운트 1증가
				rptCnt += 1;
			} else {
				//카운트 리셋
				rptCnt = 1;
			}
			//숫자 변경
			curr = tmp;
			//연속횟수가 설정한 값과 같다면 종료
			//$ANALYSIS-IGNORE
			if ( (flag = rptCnt == cmpCnt) ) {
				break;
			}
		}
		return flag;
	}
	/**
	 * 지정한 정보가 문자열에 지정한 개수 이상 포함되었는지 체크
	 * @param cnt
	 * @param info
	 * @param str
	 * @return
	 */
	public static boolean chkInfo (int cnt, String info, String str) {
		//에러 여부
		boolean flag = false;

		if (null == info) {
			return flag; 
		} else {
			for (int i = 0, length = info.length() - cnt + 1; i < length; i += 1) {
				//입력값에 정보가 3자리 이상 포함되면 에러 
				/*if ( (flag = str.indexOf(info.substring(i, i + cnt)) != -1) ) {
					break;
				}*/
				if ( str.indexOf(info.substring(i, i + cnt)) != -1 ) {
					return flag;
				}
			}
		}
		return flag;
	}
	/**
	 * 지정한 Byte로 문자열을 자르고 지정한 말줄임 문자를 붙인다.
	 * @param raw
	 * @param len
	 * @param encoding
	 * @param prefix
	 * @return
	 */
	public static String stringByteCut(String raw, int len, String encoding, String prefix) {  
		if (raw == null) return null;
		String[] ary = null;
		String result = null;
		try {
			// raw 의 byte
			byte[] rawBytes = raw.getBytes(encoding);
			int rawLength = rawBytes.length;

			int index = 0;
			int minus_byte_num = 0;
			int offset = 0;

			int hangul_byte_num = encoding.equals("UTF-8") ? 3 : 2;

			if(rawLength > len){
				int aryLength = (rawLength / len) + (rawLength % len != 0 ? 1 : 0);
				ary = new String[aryLength];

				for(int i=0; i<aryLength; i++){
					minus_byte_num = 0;
					offset = len;
					if(index + offset > rawBytes.length){
						offset = rawBytes.length - index;
					}
					for(int j=0; j<offset; j++){      
						if(((int)rawBytes[index + j] & 0x80) != 0){
							minus_byte_num ++;
						}
					}     
					if(minus_byte_num % hangul_byte_num != 0){
						offset -= minus_byte_num % hangul_byte_num;
					}     
					ary[i] = new String(rawBytes, index, offset, encoding);     
					index += offset ;

				}    
				result = ary[0] + prefix;
			} else {
				//ary = new String[]{raw};
				result = raw;
			}    
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static Boolean regex (String regex,  String str) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		return m.find();
	}
	public static boolean NumberChk(String str){
		str = str.trim();
	    char c = ' ';

	    if(str.length() == 0) return false;
	    
	    int loopCnt = str.length();
	    for(int i = 0 ; i < loopCnt ; i++){
	        c = str.charAt(i);
	        if(c < 48 || c > 57){
	            return false;
	        }
	    }
	    return true;
	}

	/**
	 * 특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리 하는 기능이다
	 */
	public static String replaceString(String str)	{
		String returnValue = "";
		if(  str== null ) 			{
			returnValue="" ;
		} else {
		  	str = str.replaceAll("&"  , "&amp;");
		    str = str.replaceAll("<"  , "&lt;");
		    str = str.replaceAll(">"  , "&gt;");
		  	str = str.replaceAll("\'" , "&apos;");
		  	str = str.replaceAll("\"" , "&quot;");
//		  	str = str.replaceAll("%"  , "&#37;");
//		  	str = str.replaceAll(" "  , "&#10;");
//		  	str = str.replaceAll("\r"  , "&#10;");
//		  	str = str.replaceAll("\n"  , "&#10;");
//		  	str = str.replaceAll("\\("  , "&#40;");
//		  	str = str.replaceAll("\\)"  , "&#41;");
//		  	str = str.replaceAll("#"  , "&#35;");
		  	returnValue = str; 
		  	
		}
		return returnValue ;
	}
	
	public static boolean adminYn(String str){ 
		return Pattern.matches("^[가-힣]*$", str);
	}
	
    public static String getClientIp(HttpServletRequest request){
		String clientIp = StringUtility.nvl(request.getHeader("X-Forwarded-For"),"");
		if(clientIp == null || clientIp.length() == 0){
			clientIp = StringUtility.nvl(request.getHeader("WL-Proxy-Client-IP"),"");
		}
		if(clientIp == null || clientIp.length() == 0){
			clientIp = StringUtility.nvl(request.getHeader("Proxy-Client-IP"),"");
		}
		if(clientIp == null || clientIp.length() == 0){
			clientIp = request.getRemoteAddr();
		}
    	return clientIp.trim();
    }
    
	public static String commaStr(Long num) {
		String commaNum = NumberFormat.getInstance(Locale.US).format(num);
		return commaNum;
	}    
	
	public static String commaStr(int num) {
		String commaNum = NumberFormat.getInstance(Locale.US).format(num);
		return commaNum;
	}	
	
	public static String nullTrim( String str ) {
		if (str == null) {
			str = "";
		} else {
			str = str.trim();
		}
		return str;
	}	
	

}