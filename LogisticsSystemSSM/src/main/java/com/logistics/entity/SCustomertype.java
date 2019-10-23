package com.logistics.entity;

import java.io.Serializable;

/**
 * (SCustomertype)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SCustomertype implements Serializable {
    private static final long serialVersionUID = -76498120516489041L;
    //客户类型ID
    private Integer customertypeid;
    //客户类型名称
    private String customername;


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