package com.logistics.po;

import java.io.Serializable;

/**
 * @author
 */
public class Car implements Serializable {
	/**
	 * 车辆ID
	 */
	private Integer carid;

	/**
	 * 用户ID
	 */
	private Integer userid;

	/**
	 * 状态ID
	 */
	private Integer statusid;

	/**
	 * 车辆类型ID
	 */
	private Integer cartypeid;

	/**
	 * 车牌号
	 */
	private String platenumber;

	/**
	 * 行驶证照片
	 */
	private String cardrivinglicensephoto;

	/**
	 * 最大载重
	 */
	private String maxload;

	/**
	 * 车厢规格
	 */
	private String carriagespecification;

	/**
	 * 私家否
	 */
	private Boolean isprivate;
	/**
	 * 状态
	 */
	private String statusname;

	private static final long serialVersionUID = 1L;

	public Integer getCarid() {
		return carid;
	}

	public void setCarid(Integer carid) {
		this.carid = carid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getStatusid() {
		return statusid;
	}

	public void setStatusid(Integer statusid) {
		this.statusid = statusid;
	}

	public Integer getCartypeid() {
		return cartypeid;
	}

	public void setCartypeid(Integer cartypeid) {
		this.cartypeid = cartypeid;
	}

	public String getPlatenumber() {
		return platenumber;
	}

	public void setPlatenumber(String platenumber) {
		this.platenumber = platenumber;
	}

	public String getCardrivinglicensephoto() {
		return cardrivinglicensephoto;
	}

	public void setCardrivinglicensephoto(String cardrivinglicensephoto) {
		this.cardrivinglicensephoto = cardrivinglicensephoto;
	}

	public String getMaxload() {
		return maxload;
	}

	public void setMaxload(String maxload) {
		this.maxload = maxload;
	}

	public String getCarriagespecification() {
		return carriagespecification;
	}

	public void setCarriagespecification(String carriagespecification) {
		this.carriagespecification = carriagespecification;
	}

	public Boolean getIsprivate() {
		return isprivate;
	}

	public void setIsprivate(Boolean isprivate) {
		this.isprivate = isprivate;
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

}