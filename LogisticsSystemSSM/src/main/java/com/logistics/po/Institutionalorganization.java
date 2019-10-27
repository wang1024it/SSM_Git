package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Institutionalorganization implements Serializable {
    /**
     * 机构组织ID
     */
    private Integer institutionalorganizationid;

    /**
     * 机构组织名称
     */
    private String institutionalorganizationname;

    /**
     * 上级机构组织ID
     */
    private Integer highinstitutionalorganizationid;

    private static final long serialVersionUID = 1L;

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