package com.logistics.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Location implements Serializable {
    /**
     * 定位ID
     */
    private Integer locationid;

    /**
     * 用户ID
     */
    private Integer userid;

    /**
     * 车辆位置
     */
    private String carlocation;

    /**
     * 上传时间
     */
    private Date uploadtime;

    private static final long serialVersionUID = 1L;

    public Integer getLocationid() {
        return locationid;
    }

    public void setLocationid(Integer locationid) {
        this.locationid = locationid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCarlocation() {
        return carlocation;
    }

    public void setCarlocation(String carlocation) {
        this.carlocation = carlocation;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }
}