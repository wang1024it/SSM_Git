package com.logistics.entity;

import java.io.Serializable;

/**
 * (SModuledetail)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SModuledetail implements Serializable {
    private static final long serialVersionUID = 847954406694636637L;
    //模块明细ID
    private Integer moduledetailid;
    //模块ID
    private Integer moduleid;
    //操作ID
    private Integer operateid;


    public Integer getModuledetailid() {
        return moduledetailid;
    }

    public void setModuledetailid(Integer moduledetailid) {
        this.moduledetailid = moduledetailid;
    }

    public Integer getModuleid() {
        return moduleid;
    }

    public void setModuleid(Integer moduleid) {
        this.moduleid = moduleid;
    }

    public Integer getOperateid() {
        return operateid;
    }

    public void setOperateid(Integer operateid) {
        this.operateid = operateid;
    }

}