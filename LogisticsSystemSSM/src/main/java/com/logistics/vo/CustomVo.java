package com.logistics.vo;

import com.logistics.po.Custom;

public class CustomVo extends Custom {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 客户类型名称
	 */
	private String customername;

	/**
	 * @return the customername
	 */
	public String getCustomername() {
		return customername;
	}

	/**
	 * @param customername
	 *            the customername to set
	 */
	public void setCustomername(String customername) {
		this.customername = customername;
	}

}
