package egovframework.com.ext.jstree.support.util;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

public class DateUtils extends org.apache.commons.lang.time.DateUtils{
    
    public static DateFormat getDateFormat(String pattern) {
        DateFormat df = new SimpleDateFormat(pattern);
        return df;
    }
    
    /**
     * 문자열로 된 날짜 정보를 Date 형으로 리턴한다.
     * @param text 문자열로 된 날짜 정보
     * @param pattern 날짜 패턴
     * @param defaultDate ParsingException이 일어나는 경우 리턴할 Date
     */
    public synchronized static Date getDate(String text, String pattern, Date defaultDate) {
        DateFormat df = getDateFormat(pattern);
        Date result = null;
        try {
            result = df.parse(text);
        } catch (Exception ie) {
            result = defaultDate;
        }
        return result;
    }
    
    /**
     * 문자열로 된 날짜 정보를 Date 형으로 리턴한다.
     * @param text 문자열로 된 날짜 정보
     * @param pattern 날짜 패턴
     * @return ParsingException이 일어나는 경우 null
     */
    public static Date getDate(String text, String pattern) {
        return getDate(text, pattern, (Date) null);
    }
    
    /**
     * 문자열로 된 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @param text 문자열로 된 날짜 정보
     * @param defaultDate ParsingException이 일어나는 경우 리턴할 Date
     */
    public static Date getDate(String text, Date defaultDate) {
        return getDate(text, "yyyy-MM-dd", defaultDate);
    }
    
    /**
     * 문자열로 된 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @param text 문자열로 된 날짜 정보
     * @return ParsingException이 일어나는 경우 null
     */
    public static Date getDate(String text) {
        if (10 >= text.length()) {
            return getDate(text, "yyyy-MM-dd");
        } else {
            return getDate(text, "yyyy-MM-dd HH:mm:ss");
        }
    }
    
    /**
     * 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @param defaultDate ParsingException이 일어나는 경우 리턴할 Date
     */
    public static Date getDate(int year, int month, int day, Date defaultDate) {
        return getDate(year + "-" + month + "-" + day, defaultDate);
    }
    
    /**
     * 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @param defaultDate ParsingException이 일어나는 경우 리턴할 Date
     */
    public static Date getDate(String year, String month, String day, Date defaultDate) {
        return getDate(year + "-" + month + "-" + day, defaultDate);
    }
    
    /**
     * 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @return ParsingException이 일어나는 경우 null
     */
    public static Date getDate(int year, int month, int day) {
        return getDate(year + "-" + month + "-" + day);
    }
    
    /**
     * 날짜 정보를 Date 형으로 리턴한다.
     * 패턴은 yyyy-MM-dd 이다.
     * @return ParsingException이 일어나는 경우 null
     */
    public static Date getDate(String year, String month, String day) {
        return getDate(year + "-" + month + "-" + day);
    }
    
    /**
     * yyyy-MM-ddTHH:mm:ss.SSS 형식을 읽어들인다.
     */
    public static Date parseDateTime(String str) {
        DateFormat df = getDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
        try {
            return df.parse(str);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
     * yyyy-MM-ddTHH:mm:ss.SSS 형식의 문자열을 얻는다.
     */
    public static String dateTimeToString(Date date) {
        DateFormat df = getDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        return df.format(date);
    }
    
    public static String dateToString(Date date) {
        DateFormat df = getDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(date);
    }
    
    public static String format(String pattern, Date date) {
        DateFormat df = getDateFormat(pattern);
        return df.format(date);
    }
    
    public static Date getStartOfDate(Date date) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getEndOfDate(Date date) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 999);
        return cal.getTime();
    }
    
    public static Date getCurrentDay() {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        return cal.getTime();
    }
    
    /**
     * 해당 날짜가 속해 있는 주의 첫째 일과 마지막 일을 구함
     *  
     * @param date 
     * @return
     */
    public static Map<String, Date> getWeekDate(Date date) {
        Map<String, Date> map = new HashMap<String, Date>();
        
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR, Calendar.SUNDAY);
        calendar.setTime(date);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        Date firstDateOfWeek = org.apache.commons.lang.time.DateUtils.addDays(date, -1 * (dayOfWeek-1));
        Date lastDateOfWeek = org.apache.commons.lang.time.DateUtils.addDays(date, 7 - dayOfWeek + 1);
        
        map.put("firstDate", firstDateOfWeek);
        map.put("lastDate", lastDateOfWeek);
        
        return map;
    }
    
    /**
     * 현재 날짜로 이전 parameter에 날짜를 구해준다.
     * @param prevDay
     * @return 
     */
    public static Date getPreDate(int preDate) {
    	GregorianCalendar cal = new GregorianCalendar();
    	cal.setTime(new Date());
        cal.add(Calendar.DATE, - preDate);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getDate(int hour, int day) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        cal.set(Calendar.DATE, day);
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getDate(int hour) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getDateWithMinute(int hour, int minute) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, minute);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getEndOfTime(int hour){
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        cal.set(Calendar.HOUR_OF_DAY, hour);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 99);
        return cal.getTime();
    }
    
    /**
     * 현재날짜기준 이전 (다음)월을 구한다.
     * @param date
     * @param month
     * @return
     */
    public static Date getMonthDate(Date date, int month) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.MONTH, month);
        cal.add(Calendar.DATE,  0);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * 현재날짜기준 이전 (다음)주을 구한다.
     * @param date
     * @param month
     * @return
     */
    public static Date getWeekDate(Date date, int week) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.MONTH, 0);
        cal.add(Calendar.DATE,  7 * week);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     *  날짜로 이전 parameter에 날짜를 구해준다.
     * @param prevDay
     * @return 
     */
    public static Date getPreDate(Date date, int preDate) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE,  - preDate);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * 현재 날짜로 이후 parameter에 날짜를 구해준다.
     * @param prevDay
     * @return 
     */
    public static Date getNextDate(int nextDate) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        cal.add(Calendar.DATE,  nextDate);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     *  날짜로 이후 parameter에 날짜를 구해준다.
     * @param prevDay
     * @return 
     */
    public static Date getNextDate(Date date, int nextDate) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE,  nextDate);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * 월초에 값을 가져온다 ex) '2013-05-01 00:00:00'
     */
    public static Date getMonthFirstDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) , 1);
        return getStartOfDate(calendar2.getTime());
    }
    
    /**
     * 월말에 값을 가져온다 ex) '2013-05-31 23:59:59.999'
     */
    public static Date getMonthLastDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1 , 0);
        return getEndOfDate(calendar2.getTime());
    }
    
    /**
     * 두 날짜의 일수 차이를 구한다.
     * endDay - startDay
     */
    public static long getDiffDay(Date startDay, Date endDay) {
    	long endDayTime = endDay.getTime();
    	long startDayTime = startDay.getTime();
    	long result = (endDayTime - startDayTime) / 86400000;
    	return result;
    }
    
    /**
     * 유닉스시간을 스트링으로 변환
     * yyyy-MM-dd HH:mm:ss
     *  ex) 1399459378 (초단위).
     */
    public static String getUnixToString(long unixTime) {
        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = format2.format(unixTime * 1000);
        return result;
    }
    
    /**
     * 유닉스시간을 Date타입으로 변환
     * yyyy-MM-dd HH:mm:ss
     *  ex) 1399459378 (초단위).
     */
    public static Date getUnixToDate(long unixTime) {
        Date result = getDate(getUnixToString(unixTime), "yyyy-MM-dd HH:mm:ss");
        return result;
    }
}
