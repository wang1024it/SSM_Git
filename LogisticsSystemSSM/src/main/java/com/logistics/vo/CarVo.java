package com.logistics.vo;

import com.logistics.po.Car;

public class CarVo extends Car {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7999259113951010375L;

	/**
	 * 车辆类型名称
	 */
	private String cartypename;

	/**
	 * 用户ID
	 */
	private Integer userid;
	/**
	 * 车队成员ID
	 */
	private Integer teammembersid;

	/**
	 * 车队ID
	 */
	private Integer motorcadeid;

	/**
	 * 姓名
	 */
	private String username;

	/**
	 * 配车否
	 */
	private String carmatching;

	/**
	 * 车队名称
	 */
	private String motorcadename;
	/**
	 * 人员状态
	 */
	private String statusname;

	/**
	 * 车辆状态
	 */
	private String carstatusname;

	/**
	 * @return the cartypename
	 */
	public String getCartypename() {
		return cartypename;
	}

	/**
	 * @param cartypename
	 *            the cartypename to set
	 */
	public void setCartypename(String cartypename) {
		this.cartypename = cartypename;
	}

	/**
	 * @return the userid
	 */
	public Integer getUserid() {
		return userid;
	}

	/**
	 * @param userid
	 *            the userid to set
	 */
	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	/**
	 * @return the teammembersid
	 */
	public Integer getTeammembersid() {
		return teammembersid;
	}

	/**
	 * @param teammembersid
	 *            the teammembersid to set
	 */
	public void setTeammembersid(Integer teammembersid) {
		this.teammembersid = teammembersid;
	}

	/**
	 * @return the motorcadeid
	 */
	public Integer getMotorcadeid() {
		return motorcadeid;
	}

	/**
	 * @param motorcadeid
	 *            the motorcadeid to set
	 */
	public void setMotorcadeid(Integer motorcadeid) {
		this.motorcadeid = motorcadeid;
	}

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
	 * @return the carmatching
	 */
	public String getCarmatching() {
		return carmatching;
	}

	/**
	 * @param carmatching
	 *            the carmatching to set
	 */
	public void setCarmatching(String carmatching) {
		this.carmatching = carmatching;
	}

	/**
	 * @return the motorcadename
	 */
	public String getMotorcadename() {
		return motorcadename;
	}

	/**
	 * @param motorcadename
	 *            the motorcadename to set
	 */
	public void setMotorcadename(String motorcadename) {
		this.motorcadename = motorcadename;
	}

	/**
	 * @return the statusname
	 */
	public String getStatusname() {
		return statusname;
	}

	/**
	 * @param statusname
	 *            the statusname to set
	 */
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}

	/**
	 * @return the carstatusname
	 */
	public String getCarstatusname() {
		return carstatusname;
	}

	/**
	 * @param carstatusname
	 *            the carstatusname to set
	 */
	public void setCarstatusname(String carstatusname) {
		this.carstatusname = carstatusname;
	}

}
