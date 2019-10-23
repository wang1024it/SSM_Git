package com.logistics.entity;

import java.io.Serializable;

/**
 * (BOrderformdetail)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BOrderformdetail implements Serializable {
    private static final long serialVersionUID = 732692333157166866L;
    //订单明细ID
    private Integer orderformdetailid;
    //货物ID
    private Integer mrchandiseid;
    //订单ID
    private Integer orderformid;
    //重量
    private Object weight;
    //体积
    private Object volume;
    //数量
    private Integer quantity;


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

    public Object getWeight() {
        return weight;
    }

    public void setWeight(Object weight) {
        this.weight = weight;
    }

    public Object getVolume() {
        return volume;
    }

    public void setVolume(Object volume) {
        this.volume = volume;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

}