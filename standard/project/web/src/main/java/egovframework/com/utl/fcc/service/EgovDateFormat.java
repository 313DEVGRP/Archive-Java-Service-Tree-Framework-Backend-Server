package egovframework.com.utl.fcc.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * 날짜 및 시간에 대한 변환을 수행하는 클래스
 */
public class EgovDateFormat {

	public static String formatDate(Date date) {
		return DateFormat.getDateInstance().format(date);
	}
	
	public static String formatDate(Locale locale, Date date) {
		return DateFormat.getDateInstance(DateFormat.DEFAULT, locale).format(date);
	}
	
	public static String formatDate(int style, Date date) {
		return DateFormat.getDateInstance(style).format(date);
	}
	
	public static String formatDate(int style, Locale locale, Date date) {
		return DateFormat.getDateInstance(style, locale).format(date);
	}
	
	public static String formatDateTime(Date date) {
		return DateFormat.getDateTimeInstance().format(date);
	}
	
	public static String formatDateTime(Locale locale, Date date) {
		return DateFormat.getDateTimeInstance(DateFormat.DEFAULT, DateFormat.DEFAULT, locale).format(date);
	}
	
	public static String formatDateTime(int dateStyle, int timeStyle, Date date) {
		return DateFormat.getDateTimeInstance(dateStyle, timeStyle).format(date);
	}
	
	public static String formatDateTime(int dateStyle, int timeStyle, Locale locale, Date date) {
		return DateFormat.getDateTimeInstance(dateStyle, timeStyle, locale).format(date);
	}

	public static String formatTime(Date date) {
		return DateFormat.getTimeInstance().format(date);
	}
	
	public static String formatTime(Locale locale, Date date) {
		return DateFormat.getTimeInstance(DateFormat.DEFAULT, locale).format(date);
	}

	public static String formatTime(int style, Date date) {
		return DateFormat.getTimeInstance(style).format(date);
	}

	public static String formatTime(int style, Locale locale, Date date) {
		return DateFormat.getTimeInstance(style, locale).format(date);
	}
	
}