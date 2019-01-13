package egovframework.com.ext.jstree.support.util;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

public class ParameterParser {
    private ServletRequest req;
    public Logger logger = LoggerFactory.getLogger(this.getClass());

    public ParameterParser(ServletRequest req) {
        this.req = req;
    }

    public String get(String name) {
        String value = req.getParameter(name);
        if (null != value && 0 == value.length()) {
            return null;
        }
        return StringUtils.trim(value);
    }

    public String get(String name, String def) {
        String value = get(name);
        if (null == value) {
            return def;
        }
        return StringUtils.trim(value);
    }

    public boolean getBoolean(String name) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return false;
        }
        value = value.toLowerCase();
        if ((value.equalsIgnoreCase("true")) || (value.equalsIgnoreCase("on")) || (value.equalsIgnoreCase("yes") || (value.equalsIgnoreCase("1")))) {
            return true;
        } else if ((value.equalsIgnoreCase("false")) || (value.equalsIgnoreCase("off")) || (value.equalsIgnoreCase("no") || (value.equalsIgnoreCase("0")))) {
            return false;
        } else {
            return false;
        }
    }

    public boolean getBoolean(String name, boolean def) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return def;
        }
        value = value.toLowerCase();
        if ((value.equalsIgnoreCase("true")) || (value.equalsIgnoreCase("on")) || (value.equalsIgnoreCase("yes"))) {
            return true;
        } else if ((value.equalsIgnoreCase("false")) || (value.equalsIgnoreCase("off")) || (value.equalsIgnoreCase("no"))) {
            return false;
        } else {
            return def;
        }
    }

    public int getInt(String name) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return 0;
        }
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
    }

    public int getInt(String name, int def) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return def;
        }
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            return def;
        }
    }

    public int getCurrency(String name) {
        return getCurrency(name, 0);
    }

    public int getCurrency(String name, int def) {
        String value = get(name);
        if (null == value) {
            return def;
        }
        int length = value.length();
        char c = 0;
        StringBuffer sbf = new StringBuffer();
        for (int i = 0; i < length; i++) {
            c = value.charAt(i);
            if ('-' == c || ('0' <= c && c <= '9')) {
                sbf.append(c);
            } else if (',' == c) {
                continue;
            } else {
                return def;
            }
        }
        try {
            return Integer.parseInt(sbf.toString());
        } catch (Exception e) {
            return def;
        }
    }

    public long getLong(String name) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return 0;
        }
        try {
            return Long.parseLong(value);
        } catch (Exception e) {
            return 0;
        }
    }

    public long getKey() {
        String key = req.getParameter("key");
        return new Long(key);
    }

    public List<Long> getKeyLong() {
        List<Long> keys = new ArrayList<>();
        String key = req.getParameter("key");

        if (!StringUtils.isEmpty(key)) {
            keys.add(new Long(key));
        } else {
            for (int i = 0; i < 1000; i++) {
                String key2 = req.getParameter("key[" + i + "]");
                if (!StringUtils.isEmpty(key2)) {
                    keys.add(new Long(key2));
                } else {
                    break;
                }
            }
        }

        return keys;
    }

    public List<Long> getKeyLong(String keyName) {
        List<Long> keys = new ArrayList<>();
        String key = req.getParameter(keyName);

        if (!StringUtils.isEmpty(key)) {
            keys.add(new Long(key));
        } else {
            for (int i = 0; i < 1000; i++) {
                String key2 = req.getParameter(keyName + "[" + i + "]");
                if (!StringUtils.isEmpty(key2)) {
                    keys.add(new Long(key2));
                } else {
                    break;
                }
            }
        }

        return keys;
    }

    public List<Long> getNameLong() {
        List<Long> keys = new ArrayList<>();
        String key = req.getParameter("name");

        if (!StringUtils.isEmpty(key)) {
            if (StringUtils.contains(key, ";")) {
                String[] temp = StringUtils.split(key, ";");
                for (String string : temp) {
                    keys.add(new Long(string));
                }
            } else {
                keys.add(new Long(key));
            }

        } else {
            for (int i = 0; i < 1000; i++) {
                String key2 = req.getParameter("name[" + i + "]");
                if (!StringUtils.isEmpty(key2)) {

                    if (StringUtils.contains(key2, ";")) {
                        String[] temp = StringUtils.split(key2, ";");
                        for (String string : temp) {
                            keys.add(new Long(string));
                        }
                    } else {
                        keys.add(new Long(key2));
                    }

                } else {
                    break;
                }
            }
        }

        return keys;
    }

    public List<String> getKeyString() {
        return getKeyString("key");
    }

    public List<String> getKeyString(String keyName) {
        List<String> keys = new ArrayList<>();
        String key = req.getParameter(keyName);

        if (!StringUtils.isEmpty(key)) {
            keys.add(new String(key));
        } else {
            for (int i = 0; i < 1000; i++) {
                String key2 = req.getParameter(keyName + "[" + i + "]");
                if (!StringUtils.isEmpty(key2)) {
                    keys.add(new String(key2));
                } else {
                    break;
                }
            }
        }

        return keys;
    }

    public boolean isModify() {
        String mode = req.getParameter("mode");
        if (StringUtils.equalsIgnoreCase(mode, "edit")) {
            return true;
        }

        return false;
    }

    public long getLong(String name, long def) {
        String value = get(name);
        if (null == value || 0 == value.length()) {
            return def;
        }
        try {
            return Long.parseLong(value);
        } catch (Exception e) {
            return def;
        }
    }

    public Date getDate(String name) {
        return getDate(name, new Date());
    }

    public Date getEndDate(String name) {
        return DateUtils.addDays(getDate(name, new Date()), 1);
    }

    public Date getDate(String name, Date def) {
        String temp = get(name);
        if (null == temp) {
            return def;
        }
        try {
            return DateUtils.getDateFormat("yyyy-MM-dd").parse(temp);
        } catch (Exception e) {
            return def;
        }
    }

    public Date getDateTime(String name) {
        return getDateTime(name, new Date());
    }

    public Date getDateTime(String name, Date def) {
        String temp = get(name);
        if (null == temp) {
            return def;
        }
        try {
            return DateUtils.getDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(temp);
        } catch (Exception e) {
            return def;
        }
    }

    public Date getDateSearchDate(int addHour) {
        String date1 = get("startDate1");

        if (StringUtils.isEmpty(date1)) {
            return org.apache.commons.lang.time.DateUtils.addMonths(new Date(), addHour);
        }

        String date = date1 + " 00:00:00";
        return DateUtils.getDate(date);
    }

    public Date getDateStart(int day) {
        String date1 = get("startDate1");

        if (StringUtils.isEmpty(date1)) {
            Date temp = org.apache.commons.lang.time.DateUtils.addDays(new Date(), day);
            date1 = DateUtils.getDateFormat("yyyy-MM-dd").format(temp);
        }
        String date = date1 + " 00:00:00";
        return DateUtils.getDate(date);
    }

    public Date getDateEnd() {
        String date1 = get("endDate1");

        if (StringUtils.isEmpty(date1)) {
            date1 = DateUtils.getDateFormat("yyyy-MM-dd").format(new Date());
        }
        String date = date1 + " 23:59:59.999";
        return DateUtils.getDate(date, "yyyy-MM-dd HH:mm:ss.SSS");
    }

    public Date getDateStartDate(int addHour) {
        String date1 = get("startDate1");
        String date2 = get("startDate2");

        if (StringUtils.isEmpty(date1) || StringUtils.isEmpty(date2)) {
            return org.apache.commons.lang.time.DateUtils.addHours(new Date(), addHour);
        }

        String date = date1 + " " + date2;
        return DateUtils.getDate(date);
    }

    public Date getDateStartDateMonth(int addMonth) {
        String date1 = get("startDate1");
        String date2 = get("startDate2");

        if (StringUtils.isEmpty(date1) || StringUtils.isEmpty(date2)) {
            return org.apache.commons.lang.time.DateUtils.addMonths(new Date(), addMonth);
        }

        String date = date1 + " " + date2;
        return DateUtils.getDate(date);
    }

    public Date getDateEndDate() {
        String date1 = get("endDate1");
        String date2 = get("endDate2");

        if (StringUtils.isEmpty(date1) || StringUtils.isEmpty(date2)) {
            return new Date();
        }

        String date = date1 + " " + date2;
        return DateUtils.getDate(date);
    }

    public Date getDateHour(String name) {
        return getDateHour(name, new Date());
    }

    public Date getDateHour(String name, Date def) {
        String temp = get(name);
        if (null == temp) {
            return def;
        }
        try {
            return DateUtils.getDateFormat("yyyy-MM-dd HH:mm").parse(temp);
        } catch (Exception e) {
            return def;
        }
    }

    public String[] getArray(String name) {
        List<String> list = new ArrayList<String>();
        String[] tempArray = req.getParameterValues(name);
        if (null == tempArray) {
            return null;
        }
        for (int i = 0; i < tempArray.length; i++) {
            if (null != tempArray[i] && 0 != tempArray[i].length()) {
                list.add(tempArray[i]);
            }
        }
        String[] returnArray = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            returnArray[i] = (String) list.get(i);
        }
        return returnArray;
    }

    public String getArrayString(String name, String separator) {
        String[] temp = this.getArray(name);
        if (null == temp) {
            return "";
        }

        return StringUtils.join(temp, separator);
    }

    public String getArraySum(String name) {
        int[] temp = getIntArray(name);
        if (null == temp || temp.length == 0) {
            return "0";
        }

        int sum = 0;
        for (int i : temp) {
            sum += i;
        }

        return String.valueOf(sum);
    }

    public int[] getIntArray(String name) {
        String[] tempArray = req.getParameterValues(name);
        if (null == tempArray) {
            return null;
        }
        int len = tempArray.length;
        int[] result = new int[len];
        int temp = 0;
        for (int i = 0; i < len; i++) {
            try {
                temp = Integer.parseInt(tempArray[i]);
            } catch (Exception e) {
                temp = 0;
            }
            result[i] = temp;
        }
        return result;
    }

    public long[] getLongArray(String name) {
        String[] tempArray = req.getParameterValues(name);
        if (null == tempArray) {
            return null;
        }
        int len = tempArray.length;
        long[] result = new long[len];
        long temp = 0;
        for (int i = 0; i < len; i++) {
            try {
                temp = Long.parseLong(tempArray[i]);
            } catch (Exception e) {
                temp = 0;
            }
            result[i] = temp;
        }
        return result;
    }

    public List<Long> getListLongArray(String name) {
        String[] tempArray = req.getParameterValues(name);
        if (null == tempArray) {
            return new ArrayList<>();
        }

        List<Long> list = new ArrayList<>();
        for (String id : tempArray) {
            list.add(Long.parseLong(id));
        }
        return list;
    }

    public List<Long> getStringForDelimeterLong(String name, String delimeter) {
        List<Long> list = new ArrayList<>();

        String temp = get(name);
        if (StringUtils.isEmpty(temp)) {
            return list;
        }

        String[] temp2 = StringUtils.split(temp, delimeter);

        for (String value : temp2) {
            if (StringUtils.isEmpty(value) || !NumberUtils.isDigits(value)) {
                continue;
            }

            list.add(NumberUtils.toLong(value));
        }

        return list;
    }

    public String toString() {
        StringBuffer sbf = new StringBuffer();
        sbf.append('{');
        Enumeration<String> en = req.getParameterNames();
        String name = null;
        String[] value = null;
        int i = 0;
        while (en.hasMoreElements()) {
            name = (String) en.nextElement();
            sbf.append("name= ");
            value = req.getParameterValues(name);
            if (null == value || 0 == value.length) {
                sbf.append(';');
                continue;
            }
            if (1 == value.length) {
                sbf.append(value);
            } else {
                sbf.append('[');
                sbf.append(value[0]);
                for (i = 1; i < value.length; i++) {
                    sbf.append(",");
                    sbf.append(value[i]);
                }
                sbf.append(']');
            }
            sbf.append(';');
        }
        sbf.append('}');
        return sbf.toString();
    }

    public String paramDebug() {
        StringBuffer sbf = new StringBuffer();
        sbf.append('{');
        Enumeration<String> en = req.getParameterNames();
        String name = null;
        String[] value = null;
        int i = 0;
        while (en.hasMoreElements()) {
            name = (String) en.nextElement();
            sbf.append(name).append(" : ");
            value = req.getParameterValues(name);
            if (null == value || 0 == value.length) {
                sbf.append(';');
                continue;
            }
            if (1 == value.length) {
                sbf.append(value[0]);
            } else {
                sbf.append('[');
                sbf.append(value[0]);
                for (i = 1; i < value.length; i++) {
                    sbf.append(",");
                    sbf.append(value[i]);
                }
                sbf.append(']');
            }
            sbf.append(';');
        }
        sbf.append('}');
        return sbf.toString();
    }
}
