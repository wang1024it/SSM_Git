package com.logistics.vo;

import java.io.Serializable;

import com.logistics.po.Power;

public class PowerVo extends Power implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6792189551126004537L;

	/**
	 * 模块名称
	 */
	private String modulename;
	/**
	 * 操作名称
	 */
	private String operatename;
	/**
	 * 用户ID
	 */
	private Integer userid;

	/**
	 * 模块路径
	 */
	private String moduleurl;

	/**
	 * @return the modulename
	 */
	public String getModulename() {
		return modulename;
	}

	/**
	 * @param modulename
	 *            the modulename to set
	 */
	public void setModulename(String modulename) {
		this.modulename = modulename;
	}

	/**
	 * @return the operatename
	 */
	public String getOperatename() {
		return operatename;
	}

	/**
	 * @param operatename
	 *            the operatename to set
	 */
	public void setOperatename(String operatename) {
		this.operatename = operatename;
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
	 * @return the moduleurl
	 */
	public String getModuleurl() {
		return moduleurl;
	}

	/**
	 * @param moduleurl
	 *            the moduleurl to set
	 */
	public void setModuleurl(String moduleurl) {
		this.moduleurl = moduleurl;
	}

}
