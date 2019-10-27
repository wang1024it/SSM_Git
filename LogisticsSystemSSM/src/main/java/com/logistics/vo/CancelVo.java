package com.logistics.vo;

import com.logistics.po.Cancel;

public class CancelVo extends Cancel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 审核人名称
	 */
	private String operatorname;

	/**
	 * @return the operatorname
	 */
	public String getOperatorname() {
		return operatorname;
	}

	/**
	 * @param operatorname
	 *            the operatorname to set
	 */
	public void setOperatorname(String operatorname) {
		this.operatorname = operatorname;
	}

}
