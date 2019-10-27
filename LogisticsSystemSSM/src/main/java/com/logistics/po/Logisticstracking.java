package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Logisticstracking implements Serializable {
    /**
     * 物流追踪ID
     */
    private Integer logisticstrackingid;

    /**
     * 订单ID
     */
    private Integer orderformid;

    /**
     * 物流信息
     */
    private String specificinformation;

    /**
     * 物流信息上传时间
     */
    private Date uploadlogisticstime;

    private static final long serialVersionUID = 1L;

    public Integer getLogisticstrackingid() {
        return logisticstrackingid;
    }

    public void setLogisticstrackingid(Integer logisticstrackingid) {
        this.logisticstrackingid = logisticstrackingid;
    }

    public Integer getOrderformid() {
        return orderformid;
    }

    public void setOrderformid(Integer orderformid) {
        this.orderformid = orderformid;
    }

    public String getSpecificinformation() {
        return specificinformation;
    }

    public void setSpecificinformation(String specificinformation) {
        this.specificinformation = specificinformation;
    }

    public Date getUploadlogisticstime() {
        return uploadlogisticstime;
    }

    public void setUploadlogisticstime(Date uploadlogisticstime) {
        this.uploadlogisticstime = uploadlogisticstime;
    }
}