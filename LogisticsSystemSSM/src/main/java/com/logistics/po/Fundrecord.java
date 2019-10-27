package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Fundrecord implements Serializable {
    /**
     * 资金记录ID
     */
    private Integer fundrecordid;

    /**
     * 用户ID
     */
    private Integer userid;

    /**
     * 审核人ID
     */
    private Integer auditorid;

    /**
     * 提取的金额
     */
    private Float extractmoney;

    /**
     * 审核否
     */
    private Boolean isaudit;

    /**
     * 操作日志
     */
    private String operationlog;

    /**
     * 申请时间
     */
    private Date applicationtime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 审核时间
     */
    private Date audittime;

    private static final long serialVersionUID = 1L;

    public Integer getFundrecordid() {
        return fundrecordid;
    }

    public void setFundrecordid(Integer fundrecordid) {
        this.fundrecordid = fundrecordid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getAuditorid() {
        return auditorid;
    }

    public void setAuditorid(Integer auditorid) {
        this.auditorid = auditorid;
    }

    public Float getExtractmoney() {
        return extractmoney;
    }

    public void setExtractmoney(Float extractmoney) {
        this.extractmoney = extractmoney;
    }

    public Boolean getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(Boolean isaudit) {
        this.isaudit = isaudit;
    }

    public String getOperationlog() {
        return operationlog;
    }

    public void setOperationlog(String operationlog) {
        this.operationlog = operationlog;
    }

    public Date getApplicationtime() {
        return applicationtime;
    }

    public void setApplicationtime(Date applicationtime) {
        this.applicationtime = applicationtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getAudittime() {
        return audittime;
    }

    public void setAudittime(Date audittime) {
        this.audittime = audittime;
    }
}