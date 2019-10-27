package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Mrchandise implements Serializable {
    /**
     * 货物ID
     */
    private Integer mrchandiseid;

    /**
     * 货物类型ID
     */
    private Integer mrchandisetypeid;

    /**
     * 货物名称
     */
    private String mrchandisename;

    private static final long serialVersionUID = 1L;

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