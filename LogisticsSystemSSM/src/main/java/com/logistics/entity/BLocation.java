package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BLocation)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BLocation implements Serializable {
    private static final long serialVersionUID = -99131469910540845L;
    //定位ID
    private Integer locationid;
    //用户ID
    private Integer userid;
    //车辆位置
    private String carlocation;
    //上传时间
    private Date uploadtime;


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