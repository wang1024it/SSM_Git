package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class City implements Serializable {
    /**
     * 城市ID
     */
    private Integer cityid;

    /**
     * 城市名称
     */
    private String cityname;

    /**
     * 省级ID
     */
    private Integer proid;

    private Integer citysort;

    private static final long serialVersionUID = 1L;

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