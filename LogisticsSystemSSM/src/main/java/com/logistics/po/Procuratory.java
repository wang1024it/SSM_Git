package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Procuratory implements Serializable {
    /**
     * 委任ID
     */
    private Integer procuratoryid;

    /**
     * 车队成员ID
     */
    private Integer teammembersid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    private static final long serialVersionUID = 1L;

    public Integer getProcuratoryid() {
        return procuratoryid;
    }

    public void setProcuratoryid(Integer procuratoryid) {
        this.procuratoryid = procuratoryid;
    }

    public Integer getTeammembersid() {
        return teammembersid;
    }

    public void setTeammembersid(Integer teammembersid) {
        this.teammembersid = teammembersid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }
}