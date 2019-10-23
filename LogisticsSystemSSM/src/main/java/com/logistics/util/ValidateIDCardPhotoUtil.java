package com.logistics.util;


public class ValidateIDCardPhotoUtil {
	/**
	 * 身份证识别
	 * 
	 * @param filePath
	 * @param idCardSide
	 * @param IDNumber
	 * @return
	 */
	public static boolean ValidateIDPoto(String filePath, String idCardSide,
			String IDNumber) {
		boolean b = false;
		try {

			if (com.logistics.util.Tools.isNotNull(filePath) && com.logistics.util.Tools.isNotNull(idCardSide)
					&& com.logistics.util.Tools.isNotNull(IDNumber)) {

				JSONObject jsonObject = JSONObject.fromObject(com.logistics.util.ValiPhoto
						.checkIDPoto(filePath, idCardSide));

				JSONObject jsobj = (JSONObject) jsonObject.get("words_result");
				JSONObject json = (JSONObject) jsobj.get("公民身份号码");
				String iDNumber = (String) json.get("words");
				if (iDNumber.equals(IDNumber)) {
					b = true;
				} else {
					b = false;
				}

			} else {
				b = false;

			}
		} catch (Exception e) {
			b = false;
		}
		return b;
	}

	/**
	 * 驾驶证识别
	 *
	 * @param filePath
	 * @return
	 */
	public static boolean driverLicence(String filePath) {
		boolean b = false;
		try {

			if (com.logistics.util.Tools.isNotNull(filePath)) {

				JSONObject jsonObject = JSONObject.fromObject(com.logistics.util.ValiPhoto
						.drivingLicence(filePath));

				JSONObject jsobj = (JSONObject) jsonObject.get("words_result");
				JSONObject json = (JSONObject) jsobj.get("证号");
				String LicenceNumber = (String) json.get("words");
				if (com.logistics.util.Tools.isNotNull(LicenceNumber)) {
					b = true;
				} else {
					b = false;
				}

			} else {
				b = false;

			}
		} catch (Exception e) {
			b = false;
		}
		return b;
	}

	/**
	 * 行驶证识别
	 *
	 * @param filePath
	 * @return
	 */
	public static boolean CarDrivingLicensePhoto(String filePath,
			String PlateNumber) {
		boolean b = false;
		try {
			if (com.logistics.util.Tools.isNotNull(filePath) && com.logistics.util.Tools.isNotNull(PlateNumber)) {
				JSONObject jsonObject = JSONObject.fromObject(com.logistics.util.ValiPhoto
						.CardrivingLicence(filePath));

				JSONObject jsobj = (JSONObject) jsonObject.get("words_result");
				JSONObject json = (JSONObject) jsobj.get("号牌号码");
				String LicenceNumber = (String) json.get("words");
				if (com.logistics.util.Tools.isNotNull(LicenceNumber)
						&& LicenceNumber.equals(PlateNumber)) {
					b = true;
				} else {
					b = false;
				}

			} else {
				b = false;

			}
		} catch (Exception e) {
			b = false;
		}
		return b;
	}

	/**
	 * 匹配营业执照
	 *
	 * @param filePath
	 * @param businessLicenseNumber
	 * @return
	 */
	public static boolean identificationBusinessLicense(String filePath,
			String businessLicenseNumber) {
		boolean b = false;
		try {
			if (com.logistics.util.Tools.isNotNull(filePath)
					&& com.logistics.util.Tools.isNotNull(businessLicenseNumber)) {
				JSONObject jsonObject = JSONObject.fromObject(com.logistics.util.ValiPhoto
						.BusinessLicense(filePath));

				JSONObject jsobj = (JSONObject) jsonObject.get("words_result");
				JSONObject json = (JSONObject) jsobj.get("证件编号");
				String LicenceNumber = (String) json.get("words");
				if (com.logistics.util.Tools.isNotNull(LicenceNumber)
						&& LicenceNumber.equals(businessLicenseNumber)) {
					b = true;
				} else {
					b = false;
				}

			} else {
				b = false;

			}
		} catch (Exception e) {
			b = false;
		}
		return b;
	}

}
