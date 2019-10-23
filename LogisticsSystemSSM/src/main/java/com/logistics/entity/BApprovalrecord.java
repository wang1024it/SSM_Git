package com.logistics.entity;

import java.io.Serializable;

/**
 * (BApprovalrecord)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:55
 */
public class BApprovalrecord implements Serializable {
    private static final long serialVersionUID = 993790186445118255L;
    //审批记录ID
    private Integer approvalrecordid;
    //订单ID
    private Integer orderformid;
    //审批人ID
    private Integer approverid;


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