package com.logistics.vo;

import com.logistics.po.Orderformdetail;

public class OrderformDetailVo extends Orderformdetail {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6014250349210607975L;

	/**
	 * 货物类型ID
	 */
	private Integer mrchandisetypeid;

	/**
	 * 货物名称
	 */
	private String mrchandisename;

	
	
	
	
	
	
	
	
	/**
	 * @return the mrchandisetypeid
	 */
	public Integer getMrchandisetypeid() {
		return mrchandisetypeid;
	}

	/**
	 * @param mrchandisetypeid
	 *            the mrchandisetypeid to set
	 */
	public void setMrchandisetypeid(Integer mrchandisetypeid) {
		this.mrchandisetypeid = mrchandisetypeid;
	}

	/**
	 * @return the mrchandisename
	 */
	public String getMrchandisename() {
		return mrchandisename;
	}

	/**
	 * @param mrchandisename
	 *            the mrchandisename to set
	 */
	public void setMrchandisename(String mrchandisename) {
		this.mrchandisename = mrchandisename;
	}

}
