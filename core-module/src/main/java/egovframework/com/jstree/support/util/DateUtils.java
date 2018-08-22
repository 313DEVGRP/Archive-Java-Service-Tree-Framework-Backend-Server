package egovframework.com.jstree.support.util;


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
    
    public static Date getDate(String text, String pattern) {
        return getDate(text, pattern, (Date) null);
    }
    
    public static Date getDate(String text, Date defaultDate) {
        return getDate(text, "yyyy-MM-dd", defaultDate);
    }
    
    public static Date getDate(String text) {
        if (10 >= text.length()) {
            return getDate(text, "yyyy-MM-dd");
        } else {
            return getDate(text, "yyyy-MM-dd HH:mm:ss");
        }
    }
    
    public static Date getDate(int year, int month, int day, Date defaultDate) {
        return getDate(year + "-" + month + "-" + day, defaultDate);
    }
    
    public static Date getDate(String year, String month, String day, Date defaultDate) {
        return getDate(year + "-" + month + "-" + day, defaultDate);
    }
    
    public static Date getDate(int year, int month, int day) {
        return getDate(year + "-" + month + "-" + day);
    }
    
    public static Date getDate(String year, String month, String day) {
        return getDate(year + "-" + month + "-" + day);
    }
    
    public static Date parseDateTime(String str) {
        DateFormat df = getDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
        try {
            return df.parse(str);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
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
    
    public static Date getMonthFirstDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) , 1);
        return getStartOfDate(calendar2.getTime());
    }
    
    public static Date getMonthLastDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        
        Calendar calendar2 = Calendar.getInstance();
        calendar2.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1 , 0);
        return getEndOfDate(calendar2.getTime());
    }
    
    public static long getDiffDay(Date startDay, Date endDay) {
    	long endDayTime = endDay.getTime();
    	long startDayTime = startDay.getTime();
    	long result = (endDayTime - startDayTime) / 86400000;
    	return result;
    }
    
    public static String getUnixToString(long unixTime) {
        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = format2.format(unixTime * 1000);
        return result;
    }
    
    public static Date getUnixToDate(long unixTime) {
        Date result = getDate(getUnixToString(unixTime), "yyyy-MM-dd HH:mm:ss");
        return result;
    }
}
