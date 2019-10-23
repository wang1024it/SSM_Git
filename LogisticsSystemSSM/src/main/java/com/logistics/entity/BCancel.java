package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BCancel)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BCancel implements Serializable {
    private static final long serialVersionUID = -29963377039260235L;
    //作废ID
    private Integer cancelid;
    //订单ID
    private Integer orderformid;
    //审核否
    private Object isaudit;
    //审核人
    private Integer operatorid;
    //作废理由
    private String cancelreason;
    //申请作废时间
    private Date applicationcanceltime;
    //审核时间
    private Date auditcanceltime;
    //违约金
    private Object defaultmoney;
    //备注
    private String cancelremark;


    public Integer getCancelid() {
        return cancelid;
    }

    public void setCancelid(Integer cancelid) {
        this.cancelid = cancelid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public Object getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(Object isaudit) {
        this.isaudit = isaudit;
    }

    public Integer getOperatorid() {
        return operatorid;
    }

    public void setOperatorid(Integer operatorid) {
        this.operatorid = operatorid;
    }

    public String getCancelreason() {
        return cancelreason;
    }

    public void setCancelreason(String cancelreason) {
        this.cancelreason = cancelreason;
    }

    public Date getApplicationcanceltime() {
        return applicationcanceltime;
    }

    public void setApplicationcanceltime(Date applicationcanceltime) {
        this.applicationcanceltime = applicationcanceltime;
    }

    public Date getAuditcanceltime() {
        return auditcanceltime;
    }

    public void setAuditcanceltime(Date auditcanceltime) {
        this.auditcanceltime = auditcanceltime;
    }

    public Object getDefaultmoney() {
        return defaultmoney;
    }

    public void setDefaultmoney(Object defaultmoney) {
        this.defaultmoney = defaultmoney;
    }

    public String getCancelremark() {
        return cancelremark;
    }

    public void setCancelremark(String cancelremark) {
        this.cancelremark = cancelremark;
    }

}