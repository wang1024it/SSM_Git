package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Motorcade implements Serializable {
    /**
     * 车队ID
     */
    private Integer motorcadeid;

    /**
     * 车队名称
     */
    private String motorcadename;

    private static final long serialVersionUID = 1L;

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