package com.logistics.vo;

import java.io.Serializable;

import com.logistics.po.Procuratory;

public class ProcuratoryVo extends Procuratory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8987066461199512693L;

	/**
	 * 订单号
	 */
	private String ordernumber;
	/**
	 * 寄货地址
	 */
	private String sendadress;

	/**
	 * 收货地址
	 */
	private String takeadress;

	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 客户名称
	 */
	private String customname;

	/**
	 * 用户ID
	 */
	private Integer userid;
	/**
	 * 订单ID
	 */
	private Integer orderformid;
	/**
	 * 车队ID
	 */
	private Integer motorcadeid;
	/**
	 * 车队名称
	 */
	private String motorcadename;

	/**
	 * 姓名
	 */
	private String username;

	/**
	 * @return the ordernumber
	 */
	public String getOrdernumber() {
		return ordernumber;
	}

	/**
	 * @param ordernumber
	 *            the ordernumber to set
	 */
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	/**
	 * @return the sendadress
	 */
	public String getSendadress() {
		return sendadress;
	}

	/**
	 * @param sendadress
	 *            the sendadress to set
	 */
	public void setSendadress(String sendadress) {
		this.sendadress = sendadress;
	}

	/**
	 * @return the takeadress
	 */
	public String getTakeadress() {
		return takeadress;
	}

	/**
	 * @param takeadress
	 *            the takeadress to set
	 */
	public void setTakeadress(String takeadress) {
		this.takeadress = takeadress;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 *            the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the customname
	 */
	public String getCustomname() {
		return customname;
	}

	/**
	 * @param customname
	 *            the customname to set
	 */
	public void setCustomname(String customname) {
		this.customname = customname;
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
	 * @return the orderformid
	 */
	public Integer getOrderformid() {
		return orderformid;
	}

	/**
	 * @param orderformid
	 *            the orderformid to set
	 */
	public void setOrderformid(Integer orderformid) {
		this.orderformid = orderformid;
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

}
