package com.logistics.entity;

import java.io.Serializable;

/**
 * (SUsertype)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public class SUsertype implements Serializable {
    private static final long serialVersionUID = 449446954681685525L;
    //用户类型ID
    private Integer usertypeid;
    //用户类型名称
    private String usertypename;


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