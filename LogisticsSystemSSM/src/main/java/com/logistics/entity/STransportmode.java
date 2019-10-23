package com.logistics.entity;

import java.io.Serializable;

/**
 * (STransportmode)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public class STransportmode implements Serializable {
    private static final long serialVersionUID = -49255898230108636L;
    //运输方式ID
    private Integer transportmodeid;
    //运输方式名称
    private String transportmodename;
    //首重费
    private Object firstcharge;
    //续重费
    private Object renewalfee;


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

    public Object getFirstcharge() {
        return firstcharge;
    }

    public void setFirstcharge(Object firstcharge) {
        this.firstcharge = firstcharge;
    }

    public Object getRenewalfee() {
        return renewalfee;
    }

    public void setRenewalfee(Object renewalfee) {
        this.renewalfee = renewalfee;
    }

}