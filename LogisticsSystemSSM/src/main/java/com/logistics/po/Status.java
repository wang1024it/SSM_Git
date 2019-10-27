package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Status implements Serializable {
    /**
     * 状态ID
     */
    private Integer statusid;

    /**
     * 状态名称
     */
    private String statusname;

    private static final long serialVersionUID = 1L;

    public Integer getStatusid() {
        return statusid;
    }

    public void setStatusid(Integer statusid) {
        this.statusid = statusid;
    }

    public String getStatusname() {
        return statusname;
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }
}