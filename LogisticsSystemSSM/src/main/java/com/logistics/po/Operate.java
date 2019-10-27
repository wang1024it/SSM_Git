package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Operate implements Serializable {
    /**
     * 操作ID
     */
    private Integer operateid;

    /**
     * 操作名称
     */
    private String operatename;

    private static final long serialVersionUID = 1L;

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