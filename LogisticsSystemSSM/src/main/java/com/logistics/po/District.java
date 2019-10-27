package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class District implements Serializable {
    /**
     * 市区ID
     */
    private Integer disid;

    /**
     * 市区名称
     */
    private String disname;

    /**
     * 城市ID
     */
    private Integer cityid;

    private Integer dissort;

    private static final long serialVersionUID = 1L;

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }

    public String getDisname() {
        return disname;
    }

    public void setDisname(String disname) {
        this.disname = disname;
    }

    public Integer getCityid() {
        return cityid;
    }

    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }

    public Integer getDissort() {
        return dissort;
    }

    public void setDissort(Integer dissort) {
        this.dissort = dissort;
    }
}