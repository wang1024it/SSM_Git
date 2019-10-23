package com.logistics.entity;

import java.io.Serializable;

/**
 * (SBillingmethod)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class SBillingmethod implements Serializable {
    private static final long serialVersionUID = -45111621781226133L;
    //计费方式ID
    private Integer billingmethodid;
    //计费方式名称
    private String billingmethodname;


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