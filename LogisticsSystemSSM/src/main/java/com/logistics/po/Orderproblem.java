package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Orderproblem implements Serializable {
    /**
     * 订单问题ID
     */
    private Integer orderproblemid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 原因
     */
    private String reason;

    /**
     * 登记时间
     */
    private Date registrationtime;

    /**
     * 以前接单员工ID
     */
    private Integer formerlyuserid;

    /**
     * 现在接单员工ID
     */
    private Integer nowuserid;

    /**
     * 订单位置
     */
    private String orderformlocation;

    /**
     * 解决否
     */
    private Boolean issolve;

    /**
     * 解决人
     */
    private Integer solutionid;

    private static final long serialVersionUID = 1L;

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

    public Boolean getIssolve() {
        return issolve;
    }

    public void setIssolve(Boolean issolve) {
        this.issolve = issolve;
    }

    public Integer getSolutionid() {
        return solutionid;
    }

    public void setSolutionid(Integer solutionid) {
        this.solutionid = solutionid;
    }
}