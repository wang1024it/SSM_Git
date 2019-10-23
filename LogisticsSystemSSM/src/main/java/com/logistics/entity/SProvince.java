package com.logistics.entity;

import java.io.Serializable;

/**
 * (SProvince)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SProvince implements Serializable {
    private static final long serialVersionUID = 739591901064158304L;
    //省份ID
    private Integer proid;
    //省份名称
    private String proname;
    
    private Integer prosort;
    //备注
    private String proremark;


    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public Integer getProsort() {
        return prosort;
    }

    public void setProsort(Integer prosort) {
        this.prosort = prosort;
    }

    public String getProremark() {
        return proremark;
    }

    public void setProremark(String proremark) {
        this.proremark = proremark;
    }

}