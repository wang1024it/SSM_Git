package com.logistics.entity;

import java.io.Serializable;

/**
 * (BTeammembers)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BTeammembers implements Serializable {
    private static final long serialVersionUID = 943950743330745458L;
    //车队成员ID
    private Integer teammembersid;
    //车队ID
    private Integer motorcadeid;
    //用户ID
    private Integer userid;


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