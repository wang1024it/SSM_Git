package com.logistics.vo;

import com.logistics.po.Route;

public class RouteVo extends Route {

	/**
	 * 
	 */
	private static final long serialVersionUID = -80470755099442856L;

	/**
	 * 起始城市名称
	 */
	private String startcityname;
	/**
	 * 起始市区名称
	 */
	private String startdisname;
	/**
	 * 起始省份名称
	 */
	private String startproname;

	/**
	 * 结束城市名称
	 */
	private String endcityname;
	/**
	 * 结束市区名称
	 */
	private String enddisname;
	/**
	 * 结束省份名称
	 */
	private String endproname;

	/**
	 * 联系人名称
	 */

	private String name;

	/**
	 * 聯係人电话
	 */
	private String phonenumber;

	/**
	 * @return the startcityname
	 */
	public String getStartcityname() {
		return startcityname;
	}

	/**
	 * @param startcityname
	 *            the startcityname to set
	 */
	public void setStartcityname(String startcityname) {
		this.startcityname = startcityname;
	}

	/**
	 * @return the startdisname
	 */
	public String getStartdisname() {
		return startdisname;
	}

	/**
	 * @param startdisname
	 *            the startdisname to set
	 */
	public void setStartdisname(String startdisname) {
		this.startdisname = startdisname;
	}

	/**
	 * @return the startproname
	 */
	public String getStartproname() {
		return startproname;
	}

	/**
	 * @param startproname
	 *            the startproname to set
	 */
	public void setStartproname(String startproname) {
		this.startproname = startproname;
	}

	/**
	 * @return the endcityname
	 */
	public String getEndcityname() {
		return endcityname;
	}

	/**
	 * @param endcityname
	 *            the endcityname to set
	 */
	public void setEndcityname(String endcityname) {
		this.endcityname = endcityname;
	}

	/**
	 * @return the enddisname
	 */
	public String getEnddisname() {
		return enddisname;
	}

	/**
	 * @param enddisname
	 *            the enddisname to set
	 */
	public void setEnddisname(String enddisname) {
		this.enddisname = enddisname;
	}

	/**
	 * @return the endproname
	 */
	public String getEndproname() {
		return endproname;
	}

	/**
	 * @param endproname
	 *            the endproname to set
	 */
	public void setEndproname(String endproname) {
		this.endproname = endproname;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the phonenumber
	 */
	public String getPhonenumber() {
		return phonenumber;
	}

	/**
	 * @param phonenumber
	 *            the phonenumber to set
	 */
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

}
