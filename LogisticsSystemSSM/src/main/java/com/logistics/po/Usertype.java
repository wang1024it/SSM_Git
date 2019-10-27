package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Usertype implements Serializable {
    /**
     * 用户类型ID
     */
    private Integer usertypeid;

    /**
     * 用户类型名称
     */
    private String usertypename;

    private static final long serialVersionUID = 1L;

    public Integer getUsertypeid() {
        return usertypeid;
    }

    public void setUsertypeid(Integer usertypeid) {
        this.usertypeid = usertypeid;
    }

    public String getUsertypename() {
        return usertypename;
    }

    public void setUsertypename(String usertypename) {
        this.usertypename = usertypename;
    }
}