package com.logistics.vo;

import com.logistics.po.Location;

public class LocationVo extends Location {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5904029331346849582L;

	/**
	 * 姓名
	 */
	private String username;

	/**
	 * 车牌号
	 */
	private String platenumber;

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the platenumber
	 */
	public String getPlatenumber() {
		return platenumber;
	}

	/**
	 * @param platenumber
	 *            the platenumber to set
	 */
	public void setPlatenumber(String platenumber) {
		this.platenumber = platenumber;
	}

}
