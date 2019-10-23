package com.logistics.entity;

import java.io.Serializable;

/**
 * (BProcuratory)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BProcuratory implements Serializable {
    private static final long serialVersionUID = 157346654188095716L;
    //委任ID
    private Integer procuratoryid;
    //车队成员ID
    private Integer teammembersid;
    //订单ID
    private Integer orderformid;


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