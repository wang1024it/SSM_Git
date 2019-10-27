package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Cancel implements Serializable {
    /**
     * 作废ID
     */
    private Integer cancelid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 审核否
     */
    private Boolean isaudit;

    /**
     * 审核人
     */
    private Integer operatorid;

    /**
     * 作废理由
     */
    private String cancelreason;

    /**
     * 申请作废时间
     */
    private Date applicationcanceltime;

    /**
     * 审核时间
     */
    private Date auditcanceltime;

    /**
     * 违约金
     */
    private Float defaultmoney;

    /**
     * 备注
     */
    private String cancelremark;

    private static final long serialVersionUID = 1L;

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

    public Boolean getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(Boolean isaudit) {
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

    public Float getDefaultmoney() {
        return defaultmoney;
    }

    public void setDefaultmoney(Float defaultmoney) {
        this.defaultmoney = defaultmoney;
    }

    public String getCancelremark() {
        return cancelremark;
    }

    public void setCancelremark(String cancelremark) {
        this.cancelremark = cancelremark;
    }
}