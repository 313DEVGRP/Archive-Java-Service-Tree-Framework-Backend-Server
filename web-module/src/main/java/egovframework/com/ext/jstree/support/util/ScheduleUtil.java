package egovframework.com.ext.jstree.support.util;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class ScheduleUtil {
       
    public static String halfTime(String value) {
        int processMinute = 30;
        int useBitsPerHour = 2;
        if(value.equals("0")) value = "00:00-00:00";
        
        String[] strArray = StringUtils.split(value, ";");
        BigInteger divNum = BigInteger.ZERO;
        
        for (String valueArrTemp : strArray) {
            String[] temp = StringUtils.split(valueArrTemp, "-");
            
            String[] startTime = StringUtils.split(temp[0], ":");
            int startHour = Integer.parseInt(startTime[0]);
            int startMinute = Integer.parseInt(startTime[1]);
            
            String[] endTime = StringUtils.split(temp[1], ":");
            int endHour = Integer.parseInt(endTime[0]);
            int endMinute = Integer.parseInt(endTime[1]);
            
            if (startMinute == processMinute) {
                startMinute = processMinute;
            } else {
                startMinute = 0;
            }
            
            if (endMinute == processMinute) {
                endMinute = processMinute;
            } else {
                endMinute = 0;
            }
            
            int startPos = (startHour * useBitsPerHour) + (startMinute / processMinute);
            int endPos = (endHour * useBitsPerHour) + (endMinute / processMinute);
            
            for (int i = startPos; i < endPos; i++) {
                divNum = divNum.setBit(i);
            }
        }
        return divNum.toString();
    }
    
    public static String getHalfTimeTime(String value) {
        int processMinute = 30;
        int useBitsPerHour = 2;
        
        List<Integer> arrList = new ArrayList<>();
        String output = "";
        
        BigInteger arrNum = new BigInteger(value);
        
        for (int j = 0; j < arrNum.bitLength(); j++) {
            boolean ret = arrNum.testBit(j);
            if (ret) {
                arrList.add(j);
            }
        }
        
        if(arrList.size() > 0 ) {
            int start = arrList.get(0), last = arrList.get(0);
            for (int i = 1; i <= arrList.size(); i++) {                
                if (i == arrList.size() || arrList.get(i) != last + 1) {
                    if (output.length() != 0) {
                        output += ", ";
                    }

                    int startHour = start / useBitsPerHour;
                    int starMinute = (start * processMinute) % 60;
                    int endHour = (last + 1) / useBitsPerHour;
                    int endMinute = ((last + 1) * processMinute) % 60;
                    output += String.format("%02d", startHour) + ":" + String.format("%02d", starMinute) + "-" + String.format("%02d", endHour) + ":" + String.format("%02d", endMinute);
                    
                    if (i != arrList.size()) {
                        start = last = arrList.get(i);
                    }
                } else {
                    last = arrList.get(i);
                }
            }
        }
        
        return output;
    }
    
    public static Map<String, Object> extenedTime(String value) {
        int processMinute = 5;
        int timePerArray = 5;
        int useBitsPerHour = 12;
        String isExtUsed = "0";
        if(value.equals("0")) value = "00:00-00:00";
        
        String[] strArray = StringUtils.split(value, ";");
        BigInteger timeHour = BigInteger.ZERO;
        BigInteger[] timeArr = { BigInteger.ZERO, BigInteger.ZERO, BigInteger.ZERO, BigInteger.ZERO, BigInteger.ZERO };
        
        for (String valueArrTemp : strArray) {
            
            String[] temp = StringUtils.split(valueArrTemp, "-");
            
            String[] startTime = StringUtils.split(temp[0], ":");
            int startHour = Integer.parseInt(startTime[0]);
            int startMinute = Integer.parseInt(startTime[1]);
            
            String[] endTime = StringUtils.split(temp[1], ":");
            int endHour = Integer.parseInt(endTime[0]);
            int endMinute = Integer.parseInt(endTime[1]);
            
            int startArr = (startHour / timePerArray);
            int endArr = (endHour) / timePerArray;
            int startPos = (startMinute / processMinute) + ((startHour % timePerArray) * useBitsPerHour);
            int endPos = (endMinute / processMinute) + ((endHour % timePerArray) * useBitsPerHour);
            
            timeHour = timeHour.setBit(startHour);
            timeHour = timeHour.setBit(endHour);
            
            if (startArr == endArr) {
                for (int i = startPos; i < endPos; i++) {
                    timeArr[startArr] = timeArr[startArr].setBit(i);
                }
            } else {
                for (int i = startArr; i <= endArr; i++) {
                    int start = 0;
                    int end = 60;
                    
                    if (i == startArr) {
                        for (int j = startPos; j < end; j++) {
                            timeArr[i] = timeArr[i].setBit(j);
                        }
                    }
                    
                    if (i == endArr) {
                        for (int j = start; j < endPos; j++) {
                            timeArr[i] = timeArr[i].setBit(j);
                        }
                    }
                }
            }
            
            if ((startMinute != 0 && startMinute != 30) || (endMinute != 0 && endMinute != 30)) {
                isExtUsed = "1";
            }
        }
        
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("isExtUsed", isExtUsed);
        result.put("hours", timeHour.toString());
        result.put("extend1", timeArr[0].toString());
        result.put("extend2", timeArr[1].toString());
        result.put("extend3", timeArr[2].toString());
        result.put("extend4", timeArr[3].toString());
        result.put("extend5", timeArr[4].toString());
        
        return result;
    }
    
    public static String getExtenedTime(String... extend) {
        int processMinute = 5; 
        int useBitsPerHour = 12;
        int maxProcessBits = 60;       
        
        List<Integer> arrList = new ArrayList<>();
        String output = "";
        
        for (int i = 0; i < extend.length; i++) {
            BigInteger arrNum = new BigInteger(String.valueOf(extend[i]));
            for (int j = 0; j < arrNum.bitLength(); j++) {
                boolean ret = arrNum.testBit(j);
                if (ret) {
                    arrList.add(j + (maxProcessBits * i));
                }
            }
        }
        
        if(arrList.size() > 0 ) {
            int start = arrList.get(0), last = arrList.get(0);
            for (int i = 1; i <= arrList.size(); i++) {             
                if (i == arrList.size() || arrList.get(i) != last + 1) {
                    if (output.length() != 0) {
                        output += ", ";
                    }

                    int startHour = start / useBitsPerHour;
                    int starMinute = (start * processMinute) % 60;
                    int endHour = (last + 1) / useBitsPerHour;
                    int endMinute = ((last + 1) * processMinute) % 60;
                    output += String.format("%02d", startHour) + ":" + String.format("%02d", starMinute) + "-" + String.format("%02d", endHour) + ":" + String.format("%02d", endMinute);
                    
                    if (i != arrList.size()) {
                        start = last = arrList.get(i);
                    }
                } else
                    last = arrList.get(i);
            }
        }
        
        return output;
    }
    
    public static String dayConvert(String value) {
        BigInteger divNum = new BigInteger("0"); 
        String[] st = StringUtils.split(Text.convertDashForString(value ,";"), ",");
        
        for (String stTemp : st) {
            divNum = divNum.setBit(Integer.parseInt(stTemp));
        }
       
        return divNum.shiftRight(1).toString();
    }
    
    public static String getDayConvert(String value) {
        BigInteger divNum = new BigInteger(value);
        String output = "";
        
        for (int j = 0; j < divNum.bitLength(); j++) {
            boolean ret = divNum.testBit(j);
            if (ret) {
                if (output.length() != 0) {
                    output += ",";
                }                
                output +=  j + 1;
            }
        }
        
        output = Text.convertCommmaForString(output, ";");
        
        return output;
    }
}
