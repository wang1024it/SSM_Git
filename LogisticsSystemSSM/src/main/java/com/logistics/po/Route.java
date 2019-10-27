package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Route implements Serializable {
    /**
     * 线路iD
     */
    private Integer routeid;

    /**
     * 线路起始ID
     */
    private Integer routestartid;

    /**
     * 线路结束ID
     */
    private Integer routeendid;

    /**
     * 联系人ID
     */
    private Integer contactid;

    /**
     * 运价
     */
    private String freightrate;

    /**
     * 时效
     */
    private String prescription;

    private static final long serialVersionUID = 1L;

    public Integer getRouteid() {
        return routeid;
    }

    public void setRouteid(Integer routeid) {
        this.routeid = routeid;
    }

    public Integer getRoutestartid() {
        return routestartid;
    }

    public void setRoutestartid(Integer routestartid) {
        this.routestartid = routestartid;
    }

    public Integer getRouteendid() {
        return routeendid;
    }

    public void setRouteendid(Integer routeendid) {
        this.routeendid = routeendid;
    }

    public Integer getContactid() {
        return contactid;
    }

    public void setContactid(Integer contactid) {
        this.contactid = contactid;
    }

    public String getFreightrate() {
        return freightrate;
    }

    public void setFreightrate(String freightrate) {
        this.freightrate = freightrate;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }
}