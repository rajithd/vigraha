package vigraha.rule.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;


public class StringUtils {

    private static final Pattern whitespacePattern = Pattern.compile("\\p{Blank}*");
    private static final Pattern allNumberPattern = Pattern.compile("\\p{Digit}*");
    private static final Pattern specialCharPattern = Pattern.compile("\\p{Punct}|\\p{Space}");
    private static final String DATE_FORMAT = "yyyy-MM-dd";
    private static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String EMPTY_STRING = "";

    /**
     * Checks the equality of two strings. Any parameter can be null.
     *
     * @param s1
     * @param s2
     * @return
     */
    public static boolean isEqual(String s1, String s2) {
        if(s1 == null) {
            return s2 == null;
        }
        return s1.equals(s2);
    }

    /**
     * Returns the enumerator name in null safe manner
     * @param enumValue
     * @return
     */
    public  static String  nullSafeName(Enum enumValue) {
        if(enumValue == null) {
            return null;
        }
        return  enumValue.name();
    }

    /**
     * Convenient method to check null or emptiness of a string
     * @param s
     * @return
     */
    public static boolean isEmptyOrWhitespace(String s) {
        if(s == null || s.length() == 0) {
            return true;
        }
        return whitespacePattern.matcher(s).matches();
    }

    /**
     * Convenient method to check null or emptiness of a string
     * @param s
     * @return
     */
    public static boolean isNumber(String s) {
        if(s == null) {return false;}
        return allNumberPattern.matcher(s).matches();
    }

    /**
     * Convenient method to replace special characters and whitespace within a string
     * @param s
     * @param c
     * @return
     */
    public static String replaceSpecialCharacter(String s, char c){
        return specialCharPattern.matcher(s).replaceAll(new String(new char[]{c}));
    }

    /**
     * Convenient method to convert date to hive date type
     * @param date
     * @return
     */
    public static String convertDateToHiveDateType(Date date) {
        return formatDate(date, DATE_FORMAT);
    }

    /**
     * Convenient method to convert date to hive date time type
     * @param date
     * @return
     */
    public static String convertDateTimeToHiveDateType(Date date) {
        return formatDate(date, DATE_TIME_FORMAT);
    }

    private static String formatDate(Date date, String format) {
        if (date == null) {
            return EMPTY_STRING;
        }
        return new SimpleDateFormat(format).format(date);
    }
}
