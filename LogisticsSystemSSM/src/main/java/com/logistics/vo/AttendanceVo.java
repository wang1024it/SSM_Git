package com.logistics.vo;

import java.io.Serializable;

import com.logistics.po.Attendance;

public class AttendanceVo extends Attendance implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 审核人名称
	 */
	private String auditorName;
	/**
	 * 用户名称
	 */
	private String userName;

	/**
	 * @return the auditorName
	 */
	public String getAuditorName() {
		return auditorName;
	}

	/**
	 * @param auditorName
	 *            the auditorName to set
	 */
	public void setAuditorName(String auditorName) {
		this.auditorName = auditorName;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
