package egovframework.com.utl.fcc.service;

import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import com.ibm.icu.util.ChineseCalendar;

public class EgovDateUtil {

	public static String addYearMonthDay(String sDate, int year, int month, int day) {

		String dateStr = validChkDate(sDate);

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());
		try {
			cal.setTime(sdf.parse(dateStr));
		} catch (ParseException e) {
			throw new IllegalArgumentException("Invalid date format: " + dateStr);
		}

		if (year != 0) {
			cal.add(Calendar.YEAR, year);
		}
		if (month != 0) {
			cal.add(Calendar.MONTH, month);
		}
		if (day != 0) {
			cal.add(Calendar.DATE, day);
		}
		
		return sdf.format(cal.getTime());
	}

	public static String addYear(String dateStr, int year) {
		return addYearMonthDay(dateStr, year, 0, 0);
	}

	public static String addMonth(String dateStr, int month) {
		return addYearMonthDay(dateStr, 0, month, 0);
	}

	public static String addDay(String dateStr, int day) {
		return addYearMonthDay(dateStr, 0, 0, day);
	}

	public static int getDaysDiff(String sDate1, String sDate2) {
		String dateStr1 = validChkDate(sDate1);
		String dateStr2 = validChkDate(sDate2);

		if (!checkDate(sDate1) || !checkDate(sDate2)) {
			throw new IllegalArgumentException("Invalid date format: args[0]=" + sDate1 + " args[1]=" + sDate2);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.getDefault());

		Date date1 = null;
		Date date2 = null;
		try {
			date1 = sdf.parse(dateStr1);
			date2 = sdf.parse(dateStr2);
		} catch (ParseException e) {
			throw new IllegalArgumentException("Invalid date format: args[0]=" + dateStr1 + " args[1]=" + dateStr2);
		}

		if (date1 != null && date2 != null) {
			int days1 = (int) ((date1.getTime() / 3600000) / 24);
			int days2 = (int) ((date2.getTime() / 3600000) / 24);
			return days2 - days1;
		} else {
			return 0;
		}

	}

	public static boolean checkDate(String sDate) {
		String dateStr = validChkDate(sDate);

		String year = dateStr.substring(0, 4);
		String month = dateStr.substring(4, 6);
		String day = dateStr.substring(6);

		return checkDate(year, month, day);
	}

	public static boolean checkDate(String year, String month, String day) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.getDefault());

			Date result = formatter.parse(year + "." + month + "." + day);
			String resultStr = formatter.format(result);
			if (resultStr.equalsIgnoreCase(year + "." + month + "." + day))
				return true;
			else
				return false;
		} catch (ParseException e) {
			return false;
		}
	}

	public static String convertDate(String strSource, String fromDateFormat, String toDateFormat, String strTimeZone) {
		SimpleDateFormat simpledateformat = null;
		Date date = null;
		String fromFormat = "";
		String toFormat = "";

		if (EgovStringUtil.isNullToString(strSource).trim().equals("")) {
			return "";
		}
		if (EgovStringUtil.isNullToString(fromDateFormat).trim().equals(""))
			fromFormat = "yyyyMMddHHmmss"; // default값
		if (EgovStringUtil.isNullToString(toDateFormat).trim().equals(""))
			toFormat = "yyyy-MM-dd HH:mm:ss"; // default값

		try {
			simpledateformat = new SimpleDateFormat(fromFormat, Locale.getDefault());
			date = simpledateformat.parse(strSource);
			if (!EgovStringUtil.isNullToString(strTimeZone).trim().equals("")) {
				simpledateformat.setTimeZone(TimeZone.getTimeZone(strTimeZone));
			}
			simpledateformat = new SimpleDateFormat(toFormat, Locale.getDefault());
		} catch (ParseException exception) {
			throw new RuntimeException(exception);
		}
		
		return simpledateformat.format(date);

	}

	public static String formatDate(String sDate, String ch) {
		String dateStr = validChkDate(sDate);

		String str = dateStr.trim();
		String yyyy = "";
		String mm = "";
		String dd = "";

		if (str.length() == 8) {
			yyyy = str.substring(0, 4);
			if (yyyy.equals("0000")) {
				return "";
			}

			mm = str.substring(4, 6);
			if (mm.equals("00")) {
				return yyyy;
			}

			dd = str.substring(6, 8);
			if (dd.equals("00")) {
				return yyyy + ch + mm;
			}
			
			return yyyy + ch + mm + ch + dd;
		
		} else if (str.length() == 6) {
			yyyy = str.substring(0, 4);
			if (yyyy.equals("0000")) {
				return "";
			}

			mm = str.substring(4, 6);
			if (mm.equals("00")) {
				return yyyy;
			}

			return yyyy + ch + mm;
			
		} else if (str.length() == 4) {
			yyyy = str.substring(0, 4);
			if (yyyy.equals("0000")) {
				return "";
			} else {
				return yyyy;
			}
		} else {
			return "";
		}
	}

	public static String formatTime(String sTime, String ch) {
		String timeStr = validChkTime(sTime);
		return timeStr.substring(0, 2) + ch + timeStr.substring(2, 4) + ch + timeStr.substring(4, 6);
	}

	public String leapYear(int year) {
		if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			return "29";
		}

		return "28";
	}

	public static boolean isLeapYear(int year) {
		if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			return false;
		}
		return true;
	}

	public static String getToday() {
		return getCurrentDate("");
	}

	public static String getCurrentDate(String dateType) {
		Calendar aCalendar = Calendar.getInstance();

		int year = aCalendar.get(Calendar.YEAR);
		int month = aCalendar.get(Calendar.MONTH) + 1;
		int date = aCalendar.get(Calendar.DATE);
		String strDate = Integer.toString(year) 
				+ ((month < 10) ? "0" + Integer.toString(month) : Integer.toString(month))
				+ ((date < 10) ? "0" + Integer.toString(date) : Integer.toString(date));

		if (!"".equals(dateType)) {
			strDate = convertDate(strDate, "yyyyMMdd", dateType);
		}

		return strDate;
	}

	public static String convertDate(String sDate, String sTime, String sFormatStr) {
		String dateStr = validChkDate(sDate);
		String timeStr = validChkTime(sTime);

		Calendar cal = null;
		cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, Integer.parseInt(dateStr.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(dateStr.substring(4, 6)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6, 8)));
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeStr.substring(0, 2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(timeStr.substring(2, 4)));

		SimpleDateFormat sdf = new SimpleDateFormat(sFormatStr, Locale.ENGLISH);

		return sdf.format(cal.getTime());
	}

	/**
	 * 입력받은 일자 사이의 임의의 일자를 반환
	 * @param sDate1 시작일자
	 * @param sDate2 종료일자
	 * @return 임의일자
	 */
	public static String getRandomDate(String sDate1, String sDate2) {
		String dateStr1 = validChkDate(sDate1);
		String dateStr2 = validChkDate(sDate2);

		String randomDate = null;

		int sYear, sMonth, sDay;
		int eYear, eMonth, eDay;

		sYear = Integer.parseInt(dateStr1.substring(0, 4));
		sMonth = Integer.parseInt(dateStr1.substring(4, 6));
		sDay = Integer.parseInt(dateStr1.substring(6, 8));

		eYear = Integer.parseInt(dateStr2.substring(0, 4));
		eMonth = Integer.parseInt(dateStr2.substring(4, 6));
		eDay = Integer.parseInt(dateStr2.substring(6, 8));

		GregorianCalendar beginDate = new GregorianCalendar(sYear, sMonth - 1, sDay, 0, 0);
		GregorianCalendar endDate = new GregorianCalendar(eYear, eMonth - 1, eDay, 23, 59);

		if (endDate.getTimeInMillis() < beginDate.getTimeInMillis()) {
			throw new IllegalArgumentException("Invalid input date : " + sDate1 + "~" + sDate2);
		}

		SecureRandom r = new SecureRandom();

		r.setSeed(new Date().getTime());

		long rand = ((r.nextLong() >>> 1) % (endDate.getTimeInMillis() - beginDate.getTimeInMillis() + 1)) + beginDate.getTimeInMillis();

		GregorianCalendar cal = new GregorianCalendar();
		//SimpleDateFormat calformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat calformat = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH);
		cal.setTimeInMillis(rand);
		randomDate = calformat.format(cal.getTime());

		// 랜덤문자열를 리턴
		return randomDate;
	}

	/**
	 * 입력받은 양력일자를 변환하여 음력일자로 반환
	 * @param sDate 양력일자
	 * @return 음력일자
	 */
	public static Map<String, String> toLunar(String sDate) {
		String dateStr = validChkDate(sDate);

		Map<String, String> hm = new HashMap<String, String>();
		hm.put("day", "");
		hm.put("leap", "0");

		if (dateStr.length() != 8) {
			return hm;
		}

		Calendar cal;
		ChineseCalendar lcal;

		cal = Calendar.getInstance();
		lcal = new ChineseCalendar();

		cal.set(Calendar.YEAR, Integer.parseInt(dateStr.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(dateStr.substring(4, 6)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6, 8)));

		lcal.setTimeInMillis(cal.getTimeInMillis());

		String year = String.valueOf(lcal.get(ChineseCalendar.EXTENDED_YEAR) - 2637);
		String month = String.valueOf(lcal.get(ChineseCalendar.MONTH) + 1);
		String day = String.valueOf(lcal.get(ChineseCalendar.DAY_OF_MONTH));
		String leap = String.valueOf(lcal.get(ChineseCalendar.IS_LEAP_MONTH));

		String pad4Str = "0000";
		String pad2Str = "00";

		String retYear = (pad4Str + year).substring(year.length());
		String retMonth = (pad2Str + month).substring(month.length());
		String retDay = (pad2Str + day).substring(day.length());

		String SDay = retYear + retMonth + retDay;

		hm.put("day", SDay);
		hm.put("leap", leap);

		return hm;
	}

	/**
	 * 입력받은 음력일자를 변환하여 양력일자로 반환
	 * @param sDate 음력일자
	 * @param iLeapMonth 음력윤달여부(IS_LEAP_MONTH)
	 * @return 양력일자
	 */
	public static String toSolar(String sDate, int iLeapMonth) {
		String dateStr = validChkDate(sDate);

		Calendar cal;
		ChineseCalendar lcal;

		cal = Calendar.getInstance();
		lcal = new ChineseCalendar();

		lcal.set(ChineseCalendar.EXTENDED_YEAR, Integer.parseInt(dateStr.substring(0, 4)) + 2637);
		lcal.set(ChineseCalendar.MONTH, Integer.parseInt(dateStr.substring(4, 6)) - 1);
		lcal.set(ChineseCalendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6, 8)));
		lcal.set(ChineseCalendar.IS_LEAP_MONTH, iLeapMonth);

		cal.setTimeInMillis(lcal.getTimeInMillis());

		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		String day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));

		String pad4Str = "0000";
		String pad2Str = "00";

		String retYear = (pad4Str + year).substring(year.length());
		String retMonth = (pad2Str + month).substring(month.length());
		String retDay = (pad2Str + day).substring(day.length());

		return retYear + retMonth + retDay;
	}

	/**
	 * 입력받은 요일의 영문명을 국문명의 요일로 반환
	 * @param sWeek 영문 요일명
	 * @return 국문 요일명
	 */
	public static String convertWeek(String sWeek) {
		String retStr = null;

		if (sWeek.equals("SUN")) {
			retStr = "일요일";
		} else if (sWeek.equals("MON")) {
			retStr = "월요일";
		} else if (sWeek.equals("TUE")) {
			retStr = "화요일";
		} else if (sWeek.equals("WED")) {
			retStr = "수요일";
		} else if (sWeek.equals("THR")) {
			retStr = "목요일";
		} else if (sWeek.equals("FRI")) {
			retStr = "금요일";
		} else if (sWeek.equals("SAT")) {
			retStr = "토요일";
		}

		return retStr;
	}

	/**
	 * 입력일자의 유효 여부를 확인
	 * @param sDate 일자
	 * @return 유효 여부
	 */
	public static boolean validDate(String sDate) {
		String dateStr = validChkDate(sDate);

		Calendar cal;
		boolean ret = false;

		cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, Integer.parseInt(dateStr.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(dateStr.substring(4, 6)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6, 8)));

		String year = String.valueOf(cal.get(Calendar.YEAR));
		String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		String day = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));

		String pad4Str = "0000";
		String pad2Str = "00";

		String retYear = (pad4Str + year).substring(year.length());
		String retMonth = (pad2Str + month).substring(month.length());
		String retDay = (pad2Str + day).substring(day.length());

		String retYMD = retYear + retMonth + retDay;

		if (sDate.equals(retYMD)) {
			ret = true;
		}

		return ret;
	}

	/**
	 * 입력일자, 요일의 유효 여부를 확인
	 * @param     sDate 일자
	 * @param     sWeek 요일 (DAY_OF_WEEK)
	 * @return    유효 여부
	 */
	public static boolean validDate(String sDate, int sWeek) {
		String dateStr = validChkDate(sDate);

		Calendar cal;
		boolean ret = false;

		cal = Calendar.getInstance();

		cal.set(Calendar.YEAR, Integer.parseInt(dateStr.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(dateStr.substring(4, 6)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dateStr.substring(6, 8)));

		int Week = cal.get(Calendar.DAY_OF_WEEK);

		if (validDate(sDate)) {
			if (sWeek == Week) {
				ret = true;
			}
		}

		return ret;
	}

	/**
	 * 입력시간의 유효 여부를 확인
	 * @param     sTime 입력시간
	 * @return    유효 여부
	 */
	public static boolean validTime(String sTime) {
		String timeStr = validChkTime(sTime);

		Calendar cal;
		boolean ret = false;

		cal = Calendar.getInstance();

		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeStr.substring(0, 2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(timeStr.substring(2, 4)));

		String HH = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
		String MM = String.valueOf(cal.get(Calendar.MINUTE));

		String pad2Str = "00";

		String retHH = (pad2Str + HH).substring(HH.length());
		String retMM = (pad2Str + MM).substring(MM.length());

		String retTime = retHH + retMM;

		if (sTime.equals(retTime)) {
			ret = true;
		}

		return ret;
	}

	/**
	 * 입력된 일자에 연, 월, 일을 가감한 날짜의 요일을 반환
	 * @param sDate 날짜
	 * @param year 연
	 * @param month 월
	 * @param day 일
	 * @return 계산된 일자의 요일(DAY_OF_WEEK)
	 */
	public static String addYMDtoWeek(String sDate, int year, int month, int day) {
		String dateStr = validChkDate(sDate);

		dateStr = addYearMonthDay(dateStr, year, month, day);

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH);
		try {
			cal.setTime(sdf.parse(dateStr));
		} catch (ParseException e) {
			throw new IllegalArgumentException("Invalid date format: " + dateStr);
		}

		SimpleDateFormat rsdf = new SimpleDateFormat("E", Locale.ENGLISH);

		return rsdf.format(cal.getTime());
	}

	/**
	 * 입력된 일자에 연, 월, 일, 시간, 분을 가감한 날짜, 시간을 포멧스트링 형식으로 반환
	 * @param sDate 날짜
	 * @param sTime 시간
	 * @param year 연
	 * @param month 월
	 * @param day 일
	 * @param hour 시간
	 * @param minute 분
	 * @param formatStr 포멧스트링
	 * @return
	 */
	public static String addYMDtoDayTime(String sDate, String sTime, int year, int month, int day, int hour, int minute, String formatStr) {
		String dateStr = validChkDate(sDate);
		String timeStr = validChkTime(sTime);

		dateStr = addYearMonthDay(dateStr, year, month, day);

		dateStr = convertDate(dateStr, timeStr, "yyyyMMddHHmm");

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm", Locale.ENGLISH);

		try {
			cal.setTime(sdf.parse(dateStr));
		} catch (ParseException e) {
			throw new IllegalArgumentException("Invalid date format: " + dateStr);
		}

		if (hour != 0) {
			cal.add(Calendar.HOUR, hour);
		}

		if (minute != 0) {
			cal.add(Calendar.MINUTE, minute);
		}

		SimpleDateFormat rsdf = new SimpleDateFormat(formatStr, Locale.ENGLISH);

		return rsdf.format(cal.getTime());
	}

	/**
	 * 입력된 일자를 int 형으로 반환
	 * @param sDate 일자
	 * @return int(일자)
	 */
	public static int datetoInt(String sDate) {
		return Integer.parseInt(convertDate(sDate, "0000", "yyyyMMdd"));
	}

	/**
	 * 입력된 시간을 int 형으로 반환
	 * @param sTime 시간
	 * @return int(시간)
	 */
	public static int timetoInt(String sTime) {
		return Integer.parseInt(convertDate("00000101", sTime, "HHmm"));
	}

	public static String validChkDate(String dateStr) {
		if (dateStr == null || !(dateStr.trim().length() == 8 || dateStr.trim().length() == 10)) {
			throw new IllegalArgumentException("Invalid date format: " + dateStr);
		}
				
		if (dateStr.length() == 10) {
			return EgovStringUtil.removeMinusChar(dateStr);
		}
		
		return dateStr;
	}

	public static String validChkTime(String timeStr) {
		if (timeStr == null || !(timeStr.trim().length() == 4)) {
			throw new IllegalArgumentException("Invalid time format: " + timeStr);
		}
		
		if (timeStr.length() == 5) {
			timeStr = EgovStringUtil.remove(timeStr, ':');
		}

		return timeStr;
	}

}
