package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BFundrecord)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BFundrecord implements Serializable {
    private static final long serialVersionUID = -86374023643487635L;
    //资金记录ID
    private Integer fundrecordid;
    //用户ID
    private Integer userid;
    //审核人ID
    private Integer auditorid;
    //提取的金额
    private Object extractmoney;
    //审核否
    private Object isaudit;
    //操作日志
    private String operationlog;
    //申请时间
    private Date applicationtime;
    //备注
    private String remark;
    //审核时间
    private Date audittime;


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

    public Object getExtractmoney() {
        return extractmoney;
    }

    public void setExtractmoney(Object extractmoney) {
        this.extractmoney = extractmoney;
    }

    public Object getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(Object isaudit) {
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