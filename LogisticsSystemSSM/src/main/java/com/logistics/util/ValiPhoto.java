package com.logistics.util;

import java.util.HashMap;

import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;
import com.logistics.util.RecognitionCharacters.HttpUtil;

public class ValiPhoto {
	// 设置APPID/AK/SK：百度云自己的帐号信息
	public static final String APP_ID = "11730046";
	public static final String API_KEY = "lGN79f2cd3c5HORxrzp6qM4Y";
	public static final String SECRET_KEY = "QYfe5XgeU83UuvIZpEY99qWOaFKqWgfd";

	/**
	 * 验证身份证照片
	 * 
	 * @param filePath
	 *            图片路径
	 * @param idCardSide
	 *            正面反面
	 * @return
	 */
	public static String checkIDPoto(String filePath, String idCardSide) { // 初始化一个AipOcr
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

		HashMap<String, String> options = new HashMap<String, String>();

		options.put("detect_direction", "true");
		/**
		 * 是否开启身份证风险类型(身份证复印件、临时身份证、身份证翻拍、修改过的身份证)功能， 默认不开启，即：false。
		 * 可选值:true-开启；false-不开启
		 */
		options.put("detect_risk", "false");
		/**
		 * front：身份证含照片的一面 back：身份证带国徽的一面 必须正确声明，否则"error_msg":
		 * "recognize id card error"
		 */

		// 本地图片

		// idcard 表示读取图片的类型是身份证
		JSONObject res = client.idcard(filePath, idCardSide, options);

		return res.toString(2);
	}

	/**
	 * 驾驶证识别
	 * 
	 * @param filePath
	 * @return
	 */
	public static String drivingLicence(String filePath) { // 初始化一个AipOcr
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

		HashMap<String, String> options = new HashMap<String, String>();

		options.put("detect_direction", "true");

		// 本地图片
		JSONObject res = client.drivingLicense(filePath, options);

		return res.toString(2);
	}

	/**
	 * 行驶证识别
	 * 
	 * @param filePath
	 * @return
	 */
	public static String CardrivingLicence(String filePath) { // 初始化一个AipOcr
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

		HashMap<String, String> options = new HashMap<String, String>();

		options.put("detect_direction", "true");

		// 本地图片
		JSONObject res = client.vehicleLicense(filePath, options);

		return res.toString(2);
	}

	public static String ValidateBandCardNumber(String bankNo) {

		// 银行代码请求接口 url
		String url = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo="
				+ bankNo + "&cardBinCheck=true";
		// 发送请求，得到 josn 类型的字符串
		String result = HttpUtil.httpRequest(url);
		// 转为 Json 对象
		JSONObject json = new JSONObject(result);
		// 获取到 bank 代码
		// String bank = String.valueOf(json.get("bank"));

		return "";
	}

	/**
	 * 识别营业执照号码
	 * 
	 * @param filePath
	 * @return
	 */
	public static String BusinessLicense(String filePath) {
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
		// 传入可选参数调用接口
		HashMap<String, String> options = new HashMap<String, String>();
		JSONObject res = client.businessLicense(filePath, options);

		return res.toString(2);
	}

}
