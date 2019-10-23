package com.logistics.util;

import java.lang.reflect.Field;

/**
 * 开发常用工具类
 * 
 * @author 方坚
 * 
 */
public class Tools {
	/**
	 * 
	 * @param value
	 * @return 如果字符串不为空或者长度不为零返回true
	 */
	public static boolean isNotNull(String value) {
		if (value == null || "".equals(value.trim())
				|| "null".equalsIgnoreCase(value)) {
			return false;
		}
		return true;
	}

	/**
	 * ISO编码转换成UTF8编码
	 * 
	 * @param s
	 * @return
	 */
	public static String ISOtoUTF8(String s) {
		try {
			s = new String(s.getBytes("iso-8859-1"), "utf-8");
		} catch (Exception e) {

		}
		return s;
	}

	/**
	 * 是否为num
	 * 
	 * @param str
	 * @return boolean
	 */
	public static boolean isNum(String str) {
		return str.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$");
	}

	/**
	 * 判断对象是否为空
	 * 
	 * @param obj
	 * @return
	 * @throws IllegalAccessException
	 */
	public static boolean checkObjFieldIsNull(Object obj)
			throws IllegalAccessException {

		boolean flag = false;
		if (obj != null) {

			for (Field f : obj.getClass().getDeclaredFields()) {
				f.setAccessible(true);

				if (f.get(obj) == null || f.get(obj).equals("")) {
					flag = true;
					return flag;
				}
			}
		}
		return flag;
	}

}
