package com.logistics.entity;

import java.io.Serializable;

/**
 * (BPower)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BPower implements Serializable {
    private static final long serialVersionUID = 629586283563630692L;
    //权限ID
    private Integer powerid;
    //用户类型ID
    private Integer usertypeid;
    //模块ID
    private Integer moduleid;


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