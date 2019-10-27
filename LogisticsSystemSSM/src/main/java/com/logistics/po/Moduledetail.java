package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Moduledetail implements Serializable {
    /**
     * 模块明细ID
     */
    private Integer moduledetailid;

    /**
     * 模块ID
     */
    private Integer moduleid;

    /**
     * 操作ID
     */
    private Integer operateid;

    private static final long serialVersionUID = 1L;

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