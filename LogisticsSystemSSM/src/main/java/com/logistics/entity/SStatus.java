package com.logistics.entity;

import java.io.Serializable;

/**
 * (SStatus)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public class SStatus implements Serializable {
    private static final long serialVersionUID = 475288719814206376L;
    //状态ID
    private Integer statusid;
    //状态名称
    private String statusname;


    public Integer getStatusid() {
        return statusid;
    }

    public void setStatusid(Integer statusid) {
        this.statusid = statusid;
    }

    public String getStatusname() {
        return statusname;
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

}