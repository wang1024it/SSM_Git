package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BReceivables)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BReceivables implements Serializable {
    private static final long serialVersionUID = 231748895593028018L;
    //收款ID
    private Integer receivablesid;
    //订单ID
    private Integer orderformid;
    //款项ID
    private Integer paymenttypeid;
    //收款内容
    private String receivablescontent;
    //收到的金钱
    private Object money;
    //收款时间
    private Date receivablestime;


    public Integer getReceivablesid() {
        return receivablesid;
    }

    public void setReceivablesid(Integer receivablesid) {
        this.receivablesid = receivablesid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public Integer getPaymenttypeid() {
        return paymenttypeid;
    }

    public void setPaymenttypeid(Integer paymenttypeid) {
        this.paymenttypeid = paymenttypeid;
    }

    public String getReceivablescontent() {
        return receivablescontent;
    }

    public void setReceivablescontent(String receivablescontent) {
        this.receivablescontent = receivablescontent;
    }

    public Object getMoney() {
        return money;
    }

    public void setMoney(Object money) {
        this.money = money;
    }

    public Date getReceivablestime() {
        return receivablestime;
    }

    public void setReceivablestime(Date receivablestime) {
        this.receivablestime = receivablestime;
    }

}