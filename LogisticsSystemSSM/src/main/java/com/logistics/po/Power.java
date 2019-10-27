package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Power implements Serializable {
    /**
     * 权限ID
     */
    private Integer powerid;

    /**
     * 用户类型ID
     */
    private Integer usertypeid;

    /**
     * 模块ID
     */
    private Integer moduleid;

    private static final long serialVersionUID = 1L;

    public Integer getPowerid() {
        return powerid;
    }

    public void setPowerid(Integer powerid) {
        this.powerid = powerid;
    }

    public Integer getUsertypeid() {
        return usertypeid;
    }

    public void setUsertypeid(Integer usertypeid) {
        this.usertypeid = usertypeid;
    }

    public Integer getModuleid() {
        return moduleid;
    }

    public void setModuleid(Integer moduleid) {
        this.moduleid = moduleid;
    }
}