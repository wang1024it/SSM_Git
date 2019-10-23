package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BOrderproblem)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class BOrderproblem implements Serializable {
    private static final long serialVersionUID = 187202058780525758L;
    //订单问题ID
    private Integer orderproblemid;
    //订单ID
    private Integer orderformid;
    //原因
    private String reason;
    //登记时间
    private Date registrationtime;
    //以前接单员工ID
    private Integer formerlyuserid;
    //现在接单员工ID
    private Integer nowuserid;
    //订单位置
    private String orderformlocation;
    //解决否
    private Object issolve;
    //解决人
    private Integer solutionid;


    public Integer getOrderproblemid() {
        return orderproblemid;
    }

    public void setOrderproblemid(Integer orderproblemid) {
        this.orderproblemid = orderproblemid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getRegistrationtime() {
        return registrationtime;
    }

    public void setRegistrationtime(Date registrationtime) {
        this.registrationtime = registrationtime;
    }

    public Integer getFormerlyuserid() {
        return formerlyuserid;
    }

    public void setFormerlyuserid(Integer formerlyuserid) {
        this.formerlyuserid = formerlyuserid;
    }

    public Integer getNowuserid() {
        return nowuserid;
    }

    public void setNowuserid(Integer nowuserid) {
        this.nowuserid = nowuserid;
    }

    public String getOrderformlocation() {
        return orderformlocation;
    }

    public void setOrderformlocation(String orderformlocation) {
        this.orderformlocation = orderformlocation;
    }

    public Object getIssolve() {
        return issolve;
    }

    public void setIssolve(Object issolve) {
        this.issolve = issolve;
    }

    public Integer getSolutionid() {
        return solutionid;
    }

    public void setSolutionid(Integer solutionid) {
        this.solutionid = solutionid;
    }

}