package com.logistics.entity;

import java.io.Serializable;

/**
 * (SPaymenttype)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SPaymenttype implements Serializable {
    private static final long serialVersionUID = -56805940954188922L;
    //款项ID
    private Integer paymenttypeid;
    //款项名称
    private String paymenttypename;


    public Integer getPaymenttypeid() {
        return paymenttypeid;
    }

    public void setPaymenttypeid(Integer paymenttypeid) {
        this.paymenttypeid = paymenttypeid;
    }

    public String getPaymenttypename() {
        return paymenttypename;
    }

    public void setPaymenttypename(String paymenttypename) {
        this.paymenttypename = paymenttypename;
    }

}