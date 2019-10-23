package com.logistics.entity;

import java.io.Serializable;

/**
 * (BUsertypedetail)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BUsertypedetail implements Serializable {
    private static final long serialVersionUID = -42181013566648635L;
    //用户类型明细ID
    private Integer usertypedetailid;
    //用户ID
    private Integer userid;
    //用户类型ID
    private Integer usertypeid;


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