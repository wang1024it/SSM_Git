package com.logistics.entity;

import java.io.Serializable;

/**
 * (SInstitutionalorganization)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SInstitutionalorganization implements Serializable {
    private static final long serialVersionUID = -74103056799362766L;
    //机构组织ID
    private Integer institutionalorganizationid;
    //机构组织名称
    private String institutionalorganizationname;
    //上级机构组织ID
    private Integer highinstitutionalorganizationid;


    public Integer getInstitutionalorganizationid() {
        return institutionalorganizationid;
    }

    public void setInstitutionalorganizationid(Integer institutionalorganizationid) {
        this.institutionalorganizationid = institutionalorganizationid;
    }

    public String getInstitutionalorganizationname() {
        return institutionalorganizationname;
    }

    public void setInstitutionalorganizationname(String institutionalorganizationname) {
        this.institutionalorganizationname = institutionalorganizationname;
    }

    public Integer getHighinstitutionalorganizationid() {
        return highinstitutionalorganizationid;
    }

    public void setHighinstitutionalorganizationid(Integer highinstitutionalorganizationid) {
        this.highinstitutionalorganizationid = highinstitutionalorganizationid;
    }

}