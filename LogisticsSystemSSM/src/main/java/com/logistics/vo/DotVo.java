package com.logistics.vo;

import com.logistics.po.Dot;

public class DotVo extends Dot {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 城市名称
	 */
	private String cityname;

	/**
	 * 省份ID
	 */
	private Integer proid;

	/**
	 * 省份名称
	 */
	private String proname;
	/**
	 * 姓名
	 */
	private String username;
	/**
	 * 市区名称
	 */
	private String disname;

	/**
	 * @return the cityname
	 */
	public String getCityname() {
		return cityname;
	}

	/**
	 * @param cityname
	 *            the cityname to set
	 */
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	/**
	 * @return the proid
	 */
	public Integer getProid() {
		return proid;
	}

	/**
	 * @param proid
	 *            the proid to set
	 */
	public void setProid(Integer proid) {
		this.proid = proid;
	}

	/**
	 * @return the proname
	 */
	public String getProname() {
		return proname;
	}

	/**
	 * @param proname
	 *            the proname to set
	 */
	public void setProname(String proname) {
		this.proname = proname;
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
	 * @return the disname
	 */
	public String getDisname() {
		return disname;
	}

	/**
	 * @param disname
	 *            the disname to set
	 */
	public void setDisname(String disname) {
		this.disname = disname;
	}

}
