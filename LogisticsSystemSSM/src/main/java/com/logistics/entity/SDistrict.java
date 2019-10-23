package com.logistics.entity;

import java.io.Serializable;

/**
 * (SDistrict)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SDistrict implements Serializable {
    private static final long serialVersionUID = 914766781887299419L;
    //市区ID
    private Integer disid;
    //市区名称
    private String disname;
    //城市ID
    private Integer cityid;
    
    private Integer dissort;


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