package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Customertype implements Serializable {
    /**
     * 客户类型ID
     */
    private Integer customertypeid;

    /**
     * 客户类型名称
     */
    private String customername;

    private static final long serialVersionUID = 1L;

    public Integer getCustomertypeid() {
        return customertypeid;
    }

    public void setCustomertypeid(Integer customertypeid) {
        this.customertypeid = customertypeid;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }
}