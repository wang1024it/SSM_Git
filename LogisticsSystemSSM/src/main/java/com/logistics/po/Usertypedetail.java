package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Usertypedetail implements Serializable {
    /**
     * 用户类型明细ID
     */
    private Integer usertypedetailid;

    /**
     * 用户ID
     */
    private Integer userid;

    /**
     * 用户类型ID
     */
    private Integer usertypeid;

    private static final long serialVersionUID = 1L;

    public Integer getUsertypedetailid() {
        return usertypedetailid;
    }

    public void setUsertypedetailid(Integer usertypedetailid) {
        this.usertypedetailid = usertypedetailid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getUsertypeid() {
        return usertypeid;
    }

    public void setUsertypeid(Integer usertypeid) {
        this.usertypeid = usertypeid;
    }
}