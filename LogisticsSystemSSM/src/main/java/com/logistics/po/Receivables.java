package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Receivables implements Serializable {
    /**
     * 收款ID
     */
    private Integer receivablesid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 款项ID
     */
    private Integer paymenttypeid;

    /**
     * 收款内容
     */
    private String receivablescontent;

    /**
     * 收到的金钱
     */
    private Float money;

    /**
     * 收款时间
     */
    private Date receivablestime;

    private static final long serialVersionUID = 1L;

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

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Date getReceivablestime() {
        return receivablestime;
    }

    public void setReceivablestime(Date receivablestime) {
        this.receivablestime = receivablestime;
    }
}