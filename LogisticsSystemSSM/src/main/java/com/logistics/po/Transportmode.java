package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Transportmode implements Serializable {
    /**
     * 运输方式ID
     */
    private Integer transportmodeid;

    /**
     * 运输方式名称
     */
    private String transportmodename;

    /**
     * 首重费
     */
    private Float firstcharge;

    /**
     * 续重费
     */
    private Float renewalfee;

    private static final long serialVersionUID = 1L;

    public Integer getTransportmodeid() {
        return transportmodeid;
    }

    public void setTransportmodeid(Integer transportmodeid) {
        this.transportmodeid = transportmodeid;
    }

    public String getTransportmodename() {
        return transportmodename;
    }

    public void setTransportmodename(String transportmodename) {
        this.transportmodename = transportmodename;
    }

    public Float getFirstcharge() {
        return firstcharge;
    }

    public void setFirstcharge(Float firstcharge) {
        this.firstcharge = firstcharge;
    }

    public Float getRenewalfee() {
        return renewalfee;
    }

    public void setRenewalfee(Float renewalfee) {
        this.renewalfee = renewalfee;
    }
}