package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Billingmethod implements Serializable {
    /**
     * 计费方式ID
     */
    private Integer billingmethodid;

    /**
     * 计费方式名称
     */
    private String billingmethodname;

    private static final long serialVersionUID = 1L;

    public Integer getBillingmethodid() {
        return billingmethodid;
    }

    public void setBillingmethodid(Integer billingmethodid) {
        this.billingmethodid = billingmethodid;
    }

    public String getBillingmethodname() {
        return billingmethodname;
    }

    public void setBillingmethodname(String billingmethodname) {
        this.billingmethodname = billingmethodname;
    }
}