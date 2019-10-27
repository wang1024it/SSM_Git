package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Mrchandisetype implements Serializable {
    /**
     * 货物类型ID
     */
    private Integer mrchandisetypeid;

    /**
     * 货物类型名称
     */
    private String mrchandisetypename;

    private static final long serialVersionUID = 1L;

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