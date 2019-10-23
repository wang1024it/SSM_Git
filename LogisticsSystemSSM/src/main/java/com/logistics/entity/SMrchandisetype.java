package com.logistics.entity;

import java.io.Serializable;

/**
 * (SMrchandisetype)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SMrchandisetype implements Serializable {
    private static final long serialVersionUID = 643319224553503153L;
    //货物类型ID
    private Integer mrchandisetypeid;
    //货物类型名称
    private String mrchandisetypename;


    public Integer getMrchandisetypeid() {
        return mrchandisetypeid;
    }

    public void setMrchandisetypeid(Integer mrchandisetypeid) {
        this.mrchandisetypeid = mrchandisetypeid;
    }

    public String getMrchandisetypename() {
        return mrchandisetypename;
    }

    public void setMrchandisetypename(String mrchandisetypename) {
        this.mrchandisetypename = mrchandisetypename;
    }

}