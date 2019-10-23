package com.logistics.entity;

import java.io.Serializable;

/**
 * (SOperate)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SOperate implements Serializable {
    private static final long serialVersionUID = -17645026178107094L;
    //操作ID
    private Integer operateid;
    //操作名称
    private String operatename;


    public Integer getOperateid() {
        return operateid;
    }

    public void setOperateid(Integer operateid) {
        this.operateid = operateid;
    }

    public String getOperatename() {
        return operatename;
    }

    public void setOperatename(String operatename) {
        this.operatename = operatename;
    }

}