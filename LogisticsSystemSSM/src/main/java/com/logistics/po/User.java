package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author
 */
public class User implements Serializable {
	/**
	 * 用户ID
	 */
	private Integer userid;

	/**
	 * 机构组织ID
	 */
	private Integer institutionalorganizationid;

	/**
	 * 状态ID
	 */
	private Integer statusid;

	/**
	 * 姓名
	 */
	private String username;

	/**
	 * 手机号码
	 */
	private String phonenumber;

	/**
	 * 登录密码
	 */
	private String loginpassword;

	/**
	 * 支付密码
	 */
	private String paymentpassword;

	/**
	 * 身份证号
	 */
	private String idnumber;

	/**
	 * 身份证照片
	 */
	private String idphoto;

	/**
	 * 个人照片
	 */
	private String photo;

	/**
	 * 性别
	 */
	private String sex;

	/**
	 * 驾驶证照片
	 */
	private String drivinglicencephoto;

	/**
	 * 人车合照
	 */
	private String mancarphoto;

	/**
	 * 带车否
	 */
	private Boolean ishavecar;

	/**
	 * 余额
	 */
	private Float remainingsum;

	/**
	 * 入职时间
	 */
	private Date entrytime;

	/**
	 * 离职时间
	 */
	private Date departuretime;

	/**
	 * 住址
	 */
	private String address;

	/**
	 * 启用否
	 */
	private Boolean enableno;

	/**
	 * 在线时间
	 */
	private Date onlinetime;

	/**
	 * 人员状态
	 */
	private String statusname;

	private static final long serialVersionUID = 1L;

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getInstitutionalorganizationid() {
		return institutionalorganizationid;
	}

	public void setInstitutionalorganizationid(
			Integer institutionalorganizationid) {
		this.institutionalorganizationid = institutionalorganizationid;
	}

	public Integer getStatusid() {
		return statusid;
	}

	public void setStatusid(Integer statusid) {
		this.statusid = statusid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getLoginpassword() {
		return loginpassword;
	}

	public void setLoginpassword(String loginpassword) {
		this.loginpassword = loginpassword;
	}

	public String getPaymentpassword() {
		return paymentpassword;
	}

	public void setPaymentpassword(String paymentpassword) {
		this.paymentpassword = paymentpassword;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getIdphoto() {
		return idphoto;
	}

	public void setIdphoto(String idphoto) {
		this.idphoto = idphoto;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDrivinglicencephoto() {
		return drivinglicencephoto;
	}

	public void setDrivinglicencephoto(String drivinglicencephoto) {
		this.drivinglicencephoto = drivinglicencephoto;
	}

	public String getMancarphoto() {
		return mancarphoto;
	}

	public void setMancarphoto(String mancarphoto) {
		this.mancarphoto = mancarphoto;
	}

	public Boolean getIshavecar() {
		return ishavecar;
	}

	public void setIshavecar(Boolean ishavecar) {
		this.ishavecar = ishavecar;
	}

	public Float getRemainingsum() {
		return remainingsum;
	}

	public void setRemainingsum(Float remainingsum) {
		this.remainingsum = remainingsum;
	}

	public Date getEntrytime() {
		return entrytime;
	}

	public void setEntrytime(Date entrytime) {
		this.entrytime = entrytime;
	}

	public Date getDeparturetime() {
		return departuretime;
	}

	public void setDeparturetime(Date departuretime) {
		this.departuretime = departuretime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Boolean getEnableno() {
		return enableno;
	}

	public void setEnableno(Boolean enableno) {
		this.enableno = enableno;
	}

	public Date getOnlinetime() {
		return onlinetime;
	}

	public void setOnlinetime(Date onlinetime) {
		this.onlinetime = onlinetime;
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