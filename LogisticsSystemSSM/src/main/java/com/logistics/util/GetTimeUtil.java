package com.logistics.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetTimeUtil {

	static Calendar now = Calendar.getInstance();
	

	/**
	 * 获取一天上班的时间
	 * 
	 * @return
	 */
	public static String getMinDayTime() {

		String Str = now.get(Calendar.YEAR)
				+ "-"
				+ ((now.get(Calendar.MONTH) + 1) < 10 ? "0"
						+ (now.get(Calendar.MONTH) + 1) : (now
						.get(Calendar.MONTH) + 1))
				+ "-"
				+ (now.get(Calendar.DAY_OF_MONTH) < 10 ? "0"
						+ now.get(Calendar.DAY_OF_MONTH) : now
						.get(Calendar.DAY_OF_MONTH)) + " 07:00:0000";
		return Str;
	}

	/***
	 * 获取一天中下班的时间
	 * 
	 * @return
	 */
	public static String getMaxDayTime() {

		String EndT = now.get(Calendar.YEAR)
				+ "-"
				+ ((now.get(Calendar.MONTH) + 1) < 10 ? "0"
						+ (now.get(Calendar.MONTH) + 1) : (now
						.get(Calendar.MONTH) + 1)) + "-"
				+ now.get(Calendar.DAY_OF_MONTH) + " 23:59:9999";
		return EndT;
	}

	/**
	 * 获取一个月中第一天的上班时间
	 * 
	 * @return
	 */
	public static String getMinMonthTime() {
		String StartTime = now.get(Calendar.YEAR)
				+ "-"
				+ ((now.get(Calendar.MONTH) + 1) < 10 ? "0"
						+ (now.get(Calendar.MONTH) + 1) : (now
						.get(Calendar.MONTH) + 1)) + "-01" + " 07:00:0000";
		return StartTime;
	}

	/**
	 * 获取一个月中最后一天的上班时间
	 * 
	 * @return
	 */
	public static String getMaxMonthTime() {
		String StartTime = now.get(Calendar.YEAR)
				+ "-"
				+ ((now.get(Calendar.MONTH) + 1) < 10 ? "0"
						+ (now.get(Calendar.MONTH) + 1) : (now
						.get(Calendar.MONTH) + 1)) + "-32" + " 23:59:9999";
		return StartTime;
	}

	/**
	 * 将字符串转成时间
	 * @param time 传入字符串时间
	 * @return
	 */
	public static Date changeStrToTime(String time) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date Time = null;
		try {
		
			Time = sdf.parse(time);

		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		return Time;
	}
    /**
     * 将longTime类型转成字符串类型
     * @param time  传入的longtime
     * @return
     */
	public static String changeTimeToStr(long time) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		 
		return	sdf.format(new Date(time));
		 
	}

	/**
	 * 获取当前时间
	 * @return
	 */
	public static String getNowTime()
	{
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		return	sdf.format(new Date());
	}
	
	
}
