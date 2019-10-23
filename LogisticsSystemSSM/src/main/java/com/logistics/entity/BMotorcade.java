package com.logistics.entity;

import java.io.Serializable;

/**
 * (BMotorcade)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BMotorcade implements Serializable {
    private static final long serialVersionUID = -95064510662442231L;
    //车队ID
    private Integer motorcadeid;
    //车队名称
    private String motorcadename;


    public Integer getMotorcadeid() {
        return motorcadeid;
    }

    public void setMotorcadeid(Integer motorcadeid) {
        this.motorcadeid = motorcadeid;
    }

    public String getMotorcadename() {
        return motorcadename;
    }

    public void setMotorcadename(String motorcadename) {
        this.motorcadename = motorcadename;
    }

}