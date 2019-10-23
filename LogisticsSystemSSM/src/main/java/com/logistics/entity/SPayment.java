package com.logistics.entity;

import java.io.Serializable;

/**
 * (SPayment)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SPayment implements Serializable {
    private static final long serialVersionUID = 852000375495756063L;
    //付款方式ID
    private Integer paymentid;
    //付款方式名称
    private String paymentname;


    public Integer getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(Integer paymentid) {
        this.paymentid = paymentid;
    }

    public String getPaymentname() {
        return paymentname;
    }

    public void setPaymentname(String paymentname) {
        this.paymentname = paymentname;
    }

}