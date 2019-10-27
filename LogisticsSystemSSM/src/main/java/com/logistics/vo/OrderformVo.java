package com.logistics.vo;

import java.io.Serializable;
import java.util.Date;

import com.logistics.po.Orderform;

public class OrderformVo extends Orderform implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4144184934152263494L;

	/**
	 * 用户ID
	 */
	private Integer userid;

	/**
	 * 姓名
	 */
	private String username;

	/**
	 * 运输方式名称
	 */
	private String transportmodename;
	/**
	 * 付款方式名称
	 */
	private String paymentname;
	/**
	 * 状态名称
	 */
	private String statusname;
	/**
	 * 车牌号
	 */
	private String platenumber;
	/**
	 * 交款否
	 */
	private boolean isReceivables;
	/**
	 * 订单问题
	 */
	private String reason;

	/**
	 * 计费方式名称
	 */
	private String billingmethodname;

	/**
	 * 解决否
	 */
	private boolean isSolve;
	/**
	 * 订单问题ID
	 */
	private Integer orderProblemID;
	/**
	 * 司机手机号码
	 */
	private String phoneNumber;

	/**
	 * 订单总数
	 */
	private Integer total;

	/**
	 * 完成总数
	 */
	private Integer finish;

	/**
	 * 未完成总数
	 */
	private Integer nofinish;

	/**
	 * 已交款总数
	 * 
	 */

	private Integer alreadyPay;

	/**
	 * 未交款总数
	 */

	private Integer unpaid;

	/**
	 * 上传的日期
	 */
	private Date shangChuangTime;

	/**
	 * 每天的数量
	 */

	private Integer dailyQuantity;

	/**
	 * 交钱否
	 * 
	 */

	private String paymoney;

	/**
	 * 审核
	 */
	private String examine;

	/**
	 * 客户名称
	 */
	private String customname;
	/**
	 * 客户手机号码
	 */
	private String customphonenumber;

	/**
	 * 作废总数
	 */
	private Integer cancel;

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber
	 *            the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the billingmethodname
	 */
	public String getBillingmethodname() {
		return billingmethodname;
	}

	/**
	 * @param billingmethodname
	 *            the billingmethodname to set
	 */
	public void setBillingmethodname(String billingmethodname) {
		this.billingmethodname = billingmethodname;
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
	 * @return the transportmodename
	 */
	public String getTransportmodename() {
		return transportmodename;
	}

	/**
	 * @param transportmodename
	 *            the transportmodename to set
	 */
	public void setTransportmodename(String transportmodename) {
		this.transportmodename = transportmodename;
	}

	/**
	 * @return the paymentname
	 */
	public String getPaymentname() {
		return paymentname;
	}

	/**
	 * @param paymentname
	 *            the paymentname to set
	 */
	public void setPaymentname(String paymentname) {
		this.paymentname = paymentname;
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
	 * @return the isReceivables
	 */
	public boolean isReceivables() {
		return isReceivables;
	}

	/**
	 * @param isReceivables
	 *            the isReceivables to set
	 */
	public void setReceivables(boolean isReceivables) {
		this.isReceivables = isReceivables;
	}

	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason
	 *            the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * @return the isSolve
	 */
	public boolean isSolve() {
		return isSolve;
	}

	/**
	 * @param isSolve
	 *            the isSolve to set
	 */
	public void setSolve(boolean isSolve) {
		this.isSolve = isSolve;
	}

	/**
	 * @return the orderProblemID
	 */
	public Integer getOrderProblemID() {
		return orderProblemID;
	}

	/**
	 * @param orderProblemID
	 *            the orderProblemID to set
	 */
	public void setOrderProblemID(Integer orderProblemID) {
		this.orderProblemID = orderProblemID;
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
	 * @return the total
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * @param total
	 *            the total to set
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * @return the finish
	 */
	public Integer getFinish() {
		return finish;
	}

	/**
	 * @param finish
	 *            the finish to set
	 */
	public void setFinish(Integer finish) {
		this.finish = finish;
	}

	/**
	 * @return the nofinish
	 */
	public Integer getNofinish() {
		return nofinish;
	}

	/**
	 * @param nofinish
	 *            the nofinish to set
	 */
	public void setNofinish(Integer nofinish) {
		this.nofinish = nofinish;
	}

	/**
	 * @return the alreadyPay
	 */
	public Integer getAlreadyPay() {
		return alreadyPay;
	}

	/**
	 * @param alreadyPay
	 *            the alreadyPay to set
	 */
	public void setAlreadyPay(Integer alreadyPay) {
		this.alreadyPay = alreadyPay;
	}

	/**
	 * @return the unpaid
	 */
	public Integer getUnpaid() {
		return unpaid;
	}

	/**
	 * @param unpaid
	 *            the unpaid to set
	 */
	public void setUnpaid(Integer unpaid) {
		this.unpaid = unpaid;
	}

	/**
	 * @return the shangChuangTime
	 */
	public Date getShangChuangTime() {
		return shangChuangTime;
	}

	/**
	 * @param shangChuangTime
	 *            the shangChuangTime to set
	 */
	public void setShangChuangTime(Date shangChuangTime) {
		this.shangChuangTime = shangChuangTime;
	}

	/**
	 * @return the dailyQuantity
	 */
	public Integer getDailyQuantity() {
		return dailyQuantity;
	}

	/**
	 * @param dailyQuantity
	 *            the dailyQuantity to set
	 */
	public void setDailyQuantity(Integer dailyQuantity) {
		this.dailyQuantity = dailyQuantity;
	}

	/**
	 * @return the paymoney
	 */
	public String getPaymoney() {
		return paymoney;
	}

	/**
	 * @param paymoney
	 *            the paymoney to set
	 */
	public void setPaymoney(String paymoney) {
		this.paymoney = paymoney;
	}

	/**
	 * @return the examine
	 */
	public String getExamine() {
		return examine;
	}

	/**
	 * @param examine
	 *            the examine to set
	 */
	public void setExamine(String examine) {
		this.examine = examine;
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

	/**
	 * @return the customphonenumber
	 */
	public String getCustomphonenumber() {
		return customphonenumber;
	}

	/**
	 * @param customphonenumber
	 *            the customphonenumber to set
	 */
	public void setCustomphonenumber(String customphonenumber) {
		this.customphonenumber = customphonenumber;
	}

	/**
	 * @return the cancel
	 */
	public Integer getCancel() {
		return cancel;
	}

	/**
	 * @param cancel
	 *            the cancel to set
	 */
	public void setCancel(Integer cancel) {
		this.cancel = cancel;
	}

}
