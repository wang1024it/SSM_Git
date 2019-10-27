package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

public class DriverLocationInformation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7426357503718466359L;

	/**
	 * 司机ID
	 */
	private Integer userID;
	/**
	 * 司机名称
	 */
	private String driverName;

	/**
	 * 车辆位置
	 */
	private String location;
	/**
	 * 上传时间
	 */
	private Date uploadTime;

	/**
	 * @return the userID
	 */
	public Integer getUserID() {
		return userID;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	/**
	 * @return the driverName
	 */
	public String getDriverName() {
		return driverName;
	}

	/**
	 * @param driverName
	 *            the driverName to set
	 */
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location
	 *            the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return the uploadTime
	 */
	public Date getUploadTime() {
		return uploadTime;
	}

	/**
	 * @param uploadTime
	 *            the uploadTime to set
	 */
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

}
