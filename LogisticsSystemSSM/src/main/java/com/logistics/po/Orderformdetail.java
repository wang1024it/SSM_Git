package com.logistics.po;

import java.io.Serializable;

/**
 * @author
 */
public class Orderformdetail implements Serializable {
	/**
	 * 订单明细ID
	 */
	private Integer orderformdetailid;

	/**
	 * 货物ID
	 */
	private Integer mrchandiseid;

	/**
	 * 订单ID
	 */
	private Integer orderformid;

	/**
	 * 重量
	 */
	private Float weight;

	/**
	 * 体积
	 */
	private Float volume;

	/**
	 * 数量
	 */
	private Integer quantity;

	private static final long serialVersionUID = 1L;

	public Integer getOrderformdetailid() {
		return orderformdetailid;
	}

	public void setOrderformdetailid(Integer orderformdetailid) {
		this.orderformdetailid = orderformdetailid;
	}

	public Integer getMrchandiseid() {
		return mrchandiseid;
	}

	public void setMrchandiseid(Integer mrchandiseid) {
		this.mrchandiseid = mrchandiseid;
	}

	public Integer getOrderformid() {
		return orderformid;
	}

	public void setOrderformid(Integer orderformid) {
		this.orderformid = orderformid;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public Float getVolume() {
		return volume;
	}

	public void setVolume(Float volume) {
		this.volume = volume;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}