package com.logistics.vo;

import com.logistics.po.User;

public class UserVo extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2567367252489289831L;

	/**
	 * 机构组织名称
	 */
	private String institutionalorganizationname;
	/**
	 * 用户类型名称
	 */
	private String usertypename;
	/**
	 * 状态名称
	 */
	private String statusname;

	/**
	 * 用户类型ID
	 */
	private Integer usertypeid;

	/**
	 * 用户类型明细ID
	 */
	private Integer usertypedetailid;

	/**
	 * 车辆ID
	 */
	private Integer carid;

	/**
	 * @return the institutionalorganizationname
	 */
	public String getInstitutionalorganizationname() {
		return institutionalorganizationname;
	}

	/**
	 * @param institutionalorganizationname
	 *            the institutionalorganizationname to set
	 */
	public void setInstitutionalorganizationname(
			String institutionalorganizationname) {
		this.institutionalorganizationname = institutionalorganizationname;
	}

	/**
	 * @return the usertypename
	 */
	public String getUsertypename() {
		return usertypename;
	}

	/**
	 * @param usertypename
	 *            the usertypename to set
	 */
	public void setUsertypename(String usertypename) {
		this.usertypename = usertypename;
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
	 * @return the usertypeid
	 */
	public Integer getUsertypeid() {
		return usertypeid;
	}

	/**
	 * @param usertypeid
	 *            the usertypeid to set
	 */
	public void setUsertypeid(Integer usertypeid) {
		this.usertypeid = usertypeid;
	}

	/**
	 * @return the usertypedetailid
	 */
	public Integer getUsertypedetailid() {
		return usertypedetailid;
	}

	/**
	 * @param usertypedetailid
	 *            the usertypedetailid to set
	 */
	public void setUsertypedetailid(Integer usertypedetailid) {
		this.usertypedetailid = usertypedetailid;
	}

	/**
	 * @return the carid
	 */
	public Integer getCarid() {
		return carid;
	}

	/**
	 * @param carid
	 *            the carid to set
	 */
	public void setCarid(Integer carid) {
		this.carid = carid;
	}

}
