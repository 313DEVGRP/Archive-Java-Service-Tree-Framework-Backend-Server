package egovframework.com.utl.fcc.service;

import java.text.NumberFormat;
import java.util.Locale;

/**
 * 숫자, 통화, 퍼센트에 대한 형식 변환을 수행하는 클래스
 */
public class EgovNumberFormat {

	private static final int MAX_FRACTION_DIGIT = 3;
	private static final boolean GROUPING_USED = true; 
	
	public static String formatNumber(Number number) {
		return formatNumber(number, GROUPING_USED, MAX_FRACTION_DIGIT);
	}
	
	public static String formatNumber(Locale locale, Number number) {
		return formatNumber(locale, number, GROUPING_USED, MAX_FRACTION_DIGIT);
	}
	
	public static String formatNumber(Number number, boolean groupingUsed) {
		return formatNumber(number, groupingUsed, MAX_FRACTION_DIGIT);
	}

	public static String formatNumber(Locale locale, Number number, boolean groupingUsed) {
		return formatNumber(locale, number, groupingUsed, MAX_FRACTION_DIGIT);
	}

	public static String formatNumber(Number number, int maxFactionDigits) {
		return formatNumber(number, GROUPING_USED, maxFactionDigits);
	}
	
	public static String formatNumber(Locale locale, Number number, int maxFactionDigits) {
		return formatNumber(locale, number, GROUPING_USED, maxFactionDigits);
	}

	public static String formatNumber(Number number, boolean groupingUsed, int maxFactionDigits) {
		NumberFormat numberberFormat = NumberFormat.getNumberInstance();
		numberberFormat.setGroupingUsed(groupingUsed);		
		numberberFormat.setMaximumFractionDigits(maxFactionDigits);
		return numberberFormat.format(number);
	}
	
	public static String formatNumber(Locale locale, Number number, boolean groupingUsed, int maxFactionDigits) {
		NumberFormat numberberFormat = NumberFormat.getNumberInstance(locale);
		numberberFormat.setGroupingUsed(groupingUsed);		
		numberberFormat.setMaximumFractionDigits(maxFactionDigits);
		return numberberFormat.format(number);
	}
	
	public static String formatCurrency(Number number) {
		return formatCurrency(number, GROUPING_USED);
	}
	
	public static String formatCurrency(Locale locale, Number number) {
		return formatCurrency(locale, number, GROUPING_USED);
	}
	
	public static String formatCurrency(Number number, boolean groupingUsed) {
		NumberFormat numberberFormat = NumberFormat.getCurrencyInstance();
		numberberFormat.setGroupingUsed(groupingUsed);		
		return numberberFormat.format(number);
	}

	public static String formatCurrency(Locale locale, Number number, boolean groupingUsed) {
		NumberFormat numberberFormat = NumberFormat.getCurrencyInstance(locale);
		numberberFormat.setGroupingUsed(groupingUsed);		
		return numberberFormat.format(number);
	}	

	public static String formatPercent(Number number) {
		return formatPercent(number, GROUPING_USED, MAX_FRACTION_DIGIT);
	}
	
	public static String formatPercent(Locale locale, Number number) {
		return formatPercent(locale, number, GROUPING_USED, MAX_FRACTION_DIGIT);
	}
	
	public static String formatPercent(Number number, boolean groupingUsed) {
		return formatPercent(number, groupingUsed, MAX_FRACTION_DIGIT);
	}

	public static String formatPercent(Locale locale, Number number, boolean groupingUsed) {
		return formatPercent(locale, number, groupingUsed, MAX_FRACTION_DIGIT);
	}

	public static String formatPercent(Number number, int maxFactionDigits) {
		return formatPercent(number, GROUPING_USED, maxFactionDigits);
	}
	
	public static String formatPercent(Locale locale, Number number, int maxFactionDigits) {
		return formatPercent(locale, number, GROUPING_USED, maxFactionDigits);
	}

	public static String formatPercent(Number number, boolean groupingUsed, int maxFactionDigits) {
		NumberFormat numberberFormat = NumberFormat.getPercentInstance();
		numberberFormat.setGroupingUsed(groupingUsed);		
		numberberFormat.setMaximumFractionDigits(maxFactionDigits);
		return numberberFormat.format(number);
	}
	
	public static String formatPercent(Locale locale, Number number, boolean groupingUsed, int maxFactionDigits) {
		NumberFormat numberberFormat = NumberFormat.getPercentInstance(locale);
		numberberFormat.setGroupingUsed(groupingUsed);		
		numberberFormat.setMaximumFractionDigits(maxFactionDigits);
		return numberberFormat.format(number);
	}

}