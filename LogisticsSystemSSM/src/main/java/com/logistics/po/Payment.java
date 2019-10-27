package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Payment implements Serializable {
    /**
     * 付款方式ID
     */
    private Integer paymentid;

    /**
     * 付款方式名称
     */
    private String paymentname;

    private static final long serialVersionUID = 1L;

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