package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BLogisticstracking)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BLogisticstracking implements Serializable {
    private static final long serialVersionUID = -65803398427534572L;
    //物流追踪ID
    private Integer logisticstrackingid;
    //订单ID
    private Integer orderformid;
    //物流信息
    private String specificinformation;
    //物流信息上传时间
    private Date uploadlogisticstime;


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