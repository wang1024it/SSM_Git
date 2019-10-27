package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Approvalrecord implements Serializable {
    /**
     * 审批记录ID
     */
    private Integer approvalrecordid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 审批人ID
     */
    private Integer approverid;

    private static final long serialVersionUID = 1L;

    public Integer getApprovalrecordid() {
        return approvalrecordid;
    }

    public void setApprovalrecordid(Integer approvalrecordid) {
        this.approvalrecordid = approvalrecordid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public Integer getApproverid() {
        return approverid;
    }

    public void setApproverid(Integer approverid) {
        this.approverid = approverid;
    }
}