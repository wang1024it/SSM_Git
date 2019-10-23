package com.logistics.entity;

import java.io.Serializable;

/**
 * (SCity)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class SCity implements Serializable {
    private static final long serialVersionUID = -32902859021177333L;
    //城市ID
    private Integer cityid;
    //城市名称
    private String cityname;
    //省级ID
    private Integer proid;
    
    private Integer citysort;


    public Integer getCityid() {
        return cityid;
    }

    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }

    public String getCityname() {
        return cityname;
    }

    public void setCityname(String cityname) {
        this.cityname = cityname;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getCitysort() {
        return citysort;
    }

    public void setCitysort(Integer citysort) {
        this.citysort = citysort;
    }

}