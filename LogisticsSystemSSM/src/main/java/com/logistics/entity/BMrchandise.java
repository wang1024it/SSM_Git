package com.logistics.entity;

import java.io.Serializable;

/**
 * (BMrchandise)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BMrchandise implements Serializable {
    private static final long serialVersionUID = 237964576061208757L;
    //货物ID
    private Integer mrchandiseid;
    //货物类型ID
    private Integer mrchandisetypeid;
    //货物名称
    private String mrchandisename;


    public Integer getMrchandiseid() {
        return mrchandiseid;
    }

    public void setMrchandiseid(Integer mrchandiseid) {
        this.mrchandiseid = mrchandiseid;
    }

    public Integer getMrchandisetypeid() {
        return mrchandisetypeid;
    }

    public void setMrchandisetypeid(Integer mrchandisetypeid) {
        this.mrchandisetypeid = mrchandisetypeid;
    }

    public String getMrchandisename() {
        return mrchandisename;
    }

    public void setMrchandisename(String mrchandisename) {
        this.mrchandisename = mrchandisename;
    }

}