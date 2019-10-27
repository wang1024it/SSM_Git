package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Paymenttype implements Serializable {
    /**
     * 款项ID
     */
    private Integer paymenttypeid;

    /**
     * 款项名称
     */
    private String paymenttypename;

    private static final long serialVersionUID = 1L;

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