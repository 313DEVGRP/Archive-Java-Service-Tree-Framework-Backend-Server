package egovframework.com.ext.jstree.support.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public class StringUtils extends org.apache.commons.lang.StringUtils {
    public static String getString(String text) {
        if (null == text) {
            return "";
        }
        
        return text;
    }
    
    public static String getString(Date text) {
        if (null == text) {
            return "";
        }
        
        return text.toString();
    }
    
    public static boolean getBoolean(String text) {
        if (equalsIgnoreCase(text, "true") || equalsIgnoreCase(text, "1")) {
            return true;
        }
        
        return false;
    }
    
    public static String getString(int value) {
        return ((Integer) value).toString();
    }
    
    public static String getString(long value) {
        return ((Long) value).toString();
    }
    
    public static String getString(boolean flag) {
        if (flag) {
            return "1";
        } else {
            return "0";
        }
    }
    
    public static String makeIpv4Cidr(String ip) {
        if (!StringUtils.contains(ip, "/")) {
            return ip + "/32";
        }
        
        return ip;
    }
    
    /**
     * 1.2.3.4/32 -> array
     */
    public static String[] makeIpv4(String ipMask) {
        if (!StringUtils.contains(ipMask, "/")) {
            String[] ips = { ipMask, "32" };
            return ips;
        } else {
            return StringUtils.split(ipMask, "/");
        }
    }
    
    /**
     * ip : 0, ipMask: 1, range:2
     */
    public static String[] getTypeForIp(String value) {
        String type = "0";
        String mask = "32";
        String ip = value;
        if (contains(value, "-")) {
            type = "2";
            String[] temp = split(value, "/");
            ip = temp[0];
        } else if (contains(value, "/")) {
            type = "1";
            String[] temp = split(value, "/");
            ip = temp[0];
            mask = temp[1];
            
            // mask 값이 32로 입력된 경우 단일 IP로 처리
            if (StringUtils.equals(mask, "32")) {
                type = "0";
            }
        }
        
        String[] result = { ip, type, mask };
        return result;
    }
    
    /**
     * 값 비교후 0번에 삭제대상 1번에 추가대상 2번에 업데이트 대상 반환.
     */
    public static List<List<String>> diffMembers(List<String> oldMember, List<String> newMember) {
        return diffMembers(oldMember.toArray(new String[oldMember.size()]), newMember.toArray(new String[newMember.size()]));
    }
    
    public static List<List<String>> diffMembersLong(List<Long> oldMember, List<Long> newMember) {
        List<String> newMembers = new ArrayList<>();
        List<String> oldMembers = new ArrayList<>();
        for (Long tempLong : oldMember) {
            oldMembers.add(StringUtils.getString(tempLong));
        }
        for (Long tempLong : newMember) {
            newMembers.add(StringUtils.getString(tempLong));
        }
        
        return diffMembers(oldMembers, newMembers);
    }
    
    public static List<List<String>> diffMembers(String[] oldMember, String[] newMember) {
        Map<String, Integer> oldMap = new LinkedHashMap<>();
        List<String> newMembers = new ArrayList<>();
        if (null != oldMember) {
            for (String string : oldMember) {
                oldMap.put(string, 0);
            }
        }
        
        // 이미 존재하는 경우 count 1 증가
        if (null != newMember && newMember.length > 0) {
            for (String string : newMember) {
                if (oldMap.containsKey(string)) {
                    oldMap.put(string, 1);
                } else {
                    newMembers.add(string);
                }
            }
        }
        
        List<String> updateMembers = new ArrayList<>();
        List<String> deleteMembers = new ArrayList<>();
        
        for (Map.Entry<String, Integer> entry : oldMap.entrySet()) {
            if (entry.getValue() > 0) {
                updateMembers.add(entry.getKey());
            } else {
                deleteMembers.add(entry.getKey());
            }
        }
        
        List<List<String>> result = new ArrayList<>();
        result.add(deleteMembers);
        result.add(newMembers);
        result.add(updateMembers);
        
        return result;
    }
    
    
    public static String removeMember(String members, String removeMember) {
        String members2 = ";" + members + ";";
        String result = StringUtils.replace(members2, removeMember + ";", "");
        
        return StringUtils.substring(result, 1, result.length() - 1);
    }
    
    /**
     * url 의 full path를 얻어온다.
     */
    public static String getFullURL(HttpServletRequest request) {
        String requestURL = request.getRequestURI();
        String queryString = request.getQueryString();
        
        if (queryString == null) {
            return requestURL.toString();
        } else {
            return requestURL + "?" + queryString;
        }
    }
    
    public static String changeApplyIcon(String applyFlag) {
        if (StringUtils.equals(applyFlag, "1")) {
            return "<img src=\"/files/image/icon/apply.png\" class=\"imgTop\" />";
        }
        return "";
    }
    
    /**
     * 문자열에서 원하는 바이트 상당의 문자를 뒤에서부터 자른다.
     * @throws UnsupportedEncodingException 
     */
    public static String substringBeforeLastByte(String str, String encoding, int cutByte) throws UnsupportedEncodingException {
        int subStrByte = str.getBytes(encoding).length - cutByte;
        
        if(subStrByte <= 0) {
            return "";
        }
        
        String temp = str;
        while (subStrByte < temp.getBytes(encoding).length) {
            temp = substring(temp, 0, temp.length() - 1);
        }
        
        return temp;
    }
    
    /**
     * 운영체제 별로 다른, 개행 문자와 탭 문자를 기준으로 문자열을 잘라 문자열 배열로 만들어 반환
     * 
     * @author 류강하
     * @since 2015. 5. 23.
     * @param str 문자열
     * @return
     */
    public static String[] splitStringByNewLineOrTab(String str) {
        
        return str.split("(\r\n)|\r|\n|\t");
    }
}
