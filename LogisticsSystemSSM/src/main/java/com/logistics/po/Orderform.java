package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Orderform implements Serializable {
    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 客户ID
     */
    private Integer customid;

    /**
     * 运输方式ID
     */
    private Integer transportmodeid;

    /**
     * 计费方式ID
     */
    private Integer billingmethodid;

    /**
     * 付款方式ID
     */
    private Integer paymentid;

    /**
     * 订单号
     */
    private String ordernumber;

    /**
     * 寄货人
     */
    private String sendname;

    /**
     * 寄货地址
     */
    private String sendadress;

    /**
     * 寄货人手机号码
     */
    private String sendphonenumber;

    /**
     * 收件公司（人）名称
     */
    private String takename;

    /**
     * 收货地址
     */
    private String takeadress;

    /**
     * 收货公司（人）手机号码
     */
    private String takephonenumber;

    /**
     * 上传时间
     */
    private Date uploadtime;

    /**
     * 实地上传否
     */
    private Boolean isindeedupload;

    /**
     * 审核否
     */
    private Boolean isauditing;

    /**
     * 审核时间
     */
    private Date audittime;

    /**
     * 运输费用
     */
    private Float transportcost;

    /**
     * 定金
     */
    private Float bargainmoney;

    /**
     * 发货时间
     */
    private Date deliverytime;

    /**
     * 收货时间
     */
    private Date receipttime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态ID
     */
    private Integer statusid;

    /**
     * 接单时间
     */
    private Date singletime;

    /**
     * 开工时间
     */
    private Date starttime;

    /**
     * 完成时间
     */
    private Date finishtime;

    /**
     * 完成否
     */
    private Boolean isfinish;

    /**
     * 是否有问题
     */
    private Boolean isproblem;

    /**
     * 是否作废
     */
    private Boolean iscancel;

    private static final long serialVersionUID = 1L;

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public Integer getCustomid() {
        return customid;
    }

    public void setCustomid(Integer customid) {
        this.customid = customid;
    }

    public Integer getTransportmodeid() {
        return transportmodeid;
    }

    public void setTransportmodeid(Integer transportmodeid) {
        this.transportmodeid = transportmodeid;
    }

    public Integer getBillingmethodid() {
        return billingmethodid;
    }

    public void setBillingmethodid(Integer billingmethodid) {
        this.billingmethodid = billingmethodid;
    }

    public Integer getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(Integer paymentid) {
        this.paymentid = paymentid;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getSendname() {
        return sendname;
    }

    public void setSendname(String sendname) {
        this.sendname = sendname;
    }

    public String getSendadress() {
        return sendadress;
    }

    public void setSendadress(String sendadress) {
        this.sendadress = sendadress;
    }

    public String getSendphonenumber() {
        return sendphonenumber;
    }

    public void setSendphonenumber(String sendphonenumber) {
        this.sendphonenumber = sendphonenumber;
    }

    public String getTakename() {
        return takename;
    }

    public void setTakename(String takename) {
        this.takename = takename;
    }

    public String getTakeadress() {
        return takeadress;
    }

    public void setTakeadress(String takeadress) {
        this.takeadress = takeadress;
    }

    public String getTakephonenumber() {
        return takephonenumber;
    }

    public void setTakephonenumber(String takephonenumber) {
        this.takephonenumber = takephonenumber;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public Boolean getIsindeedupload() {
        return isindeedupload;
    }

    public void setIsindeedupload(Boolean isindeedupload) {
        this.isindeedupload = isindeedupload;
    }

    public Boolean getIsauditing() {
        return isauditing;
    }

    public void setIsauditing(Boolean isauditing) {
        this.isauditing = isauditing;
    }

    public Date getAudittime() {
        return audittime;
    }

    public void setAudittime(Date audittime) {
        this.audittime = audittime;
    }

    public Float getTransportcost() {
        return transportcost;
    }

    public void setTransportcost(Float transportcost) {
        this.transportcost = transportcost;
    }

    public Float getBargainmoney() {
        return bargainmoney;
    }

    public void setBargainmoney(Float bargainmoney) {
        this.bargainmoney = bargainmoney;
    }

    public Date getDeliverytime() {
        return deliverytime;
    }

    public void setDeliverytime(Date deliverytime) {
        this.deliverytime = deliverytime;
    }

    public Date getReceipttime() {
        return receipttime;
    }

    public void setReceipttime(Date receipttime) {
        this.receipttime = receipttime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getStatusid() {
        return statusid;
    }

    public void setStatusid(Integer statusid) {
        this.statusid = statusid;
    }

    public Date getSingletime() {
        return singletime;
    }

    public void setSingletime(Date singletime) {
        this.singletime = singletime;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(Date finishtime) {
        this.finishtime = finishtime;
    }

    public Boolean getIsfinish() {
        return isfinish;
    }

    public void setIsfinish(Boolean isfinish) {
        this.isfinish = isfinish;
    }

    public Boolean getIsproblem() {
        return isproblem;
    }

    public void setIsproblem(Boolean isproblem) {
        this.isproblem = isproblem;
    }

    public Boolean getIscancel() {
        return iscancel;
    }

    public void setIscancel(Boolean iscancel) {
        this.iscancel = iscancel;
    }
}