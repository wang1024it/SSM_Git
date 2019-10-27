package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Teammembers implements Serializable {
    /**
     * 车队成员ID
     */
    private Integer teammembersid;

    /**
     * 车队ID
     */
    private Integer motorcadeid;

    /**
     * 用户ID
     */
    private Integer userid;

    private static final long serialVersionUID = 1L;

    public Integer getTeammembersid() {
        return teammembersid;
    }

    public void setTeammembersid(Integer teammembersid) {
        this.teammembersid = teammembersid;
    }

    public Integer getMotorcadeid() {
        return motorcadeid;
    }

    public void setMotorcadeid(Integer motorcadeid) {
        this.motorcadeid = motorcadeid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}