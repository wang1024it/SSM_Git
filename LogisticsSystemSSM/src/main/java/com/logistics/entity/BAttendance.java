package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BAttendance)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BAttendance implements Serializable {
    private static final long serialVersionUID = -32609364815618768L;
    //考勤ID
    private Integer attendanceid;
    //审核人ID
    private Integer auditorid;
    //用户ID
    private Integer userid;
    //车辆ID
    private Integer carid;
    //批准否
    private Object isratification;
    //上班时间
    private Date startworktime;
    //下班时间
    private Date offwork;
    //备注
    private String remark;
    //区分上下班
    private String mark;
    //审核否
    private Object isaudit;
    //审核时间
    private Date audittime;
    //申请时间
    private Date applicationtime;
    //请假理由
    private String reason;
    //请假天数
    private String leaveday;
    //上班的车辆里程
    private Object startmileage;
    //上班车辆油量
    private Object startoilmass;
    //上班车辆位置
    private String startlocation;
    //下帮的车辆里程
    private Object offmileage;
    //下班的车辆油量
    private Object offoilmass;
    //下班的车辆位置
    private String offlocation;


    public Integer getAttendanceid() {
        return attendanceid;
    }

    public void setAttendanceid(Integer attendanceid) {
        this.attendanceid = attendanceid;
    }

    public Integer getAuditorid() {
        return auditorid;
    }

    public void setAuditorid(Integer auditorid) {
        this.auditorid = auditorid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    public Object getIsratification() {
        return isratification;
    }

    public void setIsratification(Object isratification) {
        this.isratification = isratification;
    }

    public Date getStartworktime() {
        return startworktime;
    }

    public void setStartworktime(Date startworktime) {
        this.startworktime = startworktime;
    }

    public Date getOffwork() {
        return offwork;
    }

    public void setOffwork(Date offwork) {
        this.offwork = offwork;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public Object getIsaudit() {
        return isaudit;
    }

    public void setIsaudit(Object isaudit) {
        this.isaudit = isaudit;
    }

    public Date getAudittime() {
        return audittime;
    }

    public void setAudittime(Date audittime) {
        this.audittime = audittime;
    }

    public Date getApplicationtime() {
        return applicationtime;
    }

    public void setApplicationtime(Date applicationtime) {
        this.applicationtime = applicationtime;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getLeaveday() {
        return leaveday;
    }

    public void setLeaveday(String leaveday) {
        this.leaveday = leaveday;
    }

    public Object getStartmileage() {
        return startmileage;
    }

    public void setStartmileage(Object startmileage) {
        this.startmileage = startmileage;
    }

    public Object getStartoilmass() {
        return startoilmass;
    }

    public void setStartoilmass(Object startoilmass) {
        this.startoilmass = startoilmass;
    }

    public String getStartlocation() {
        return startlocation;
    }

    public void setStartlocation(String startlocation) {
        this.startlocation = startlocation;
    }

    public Object getOffmileage() {
        return offmileage;
    }

    public void setOffmileage(Object offmileage) {
        this.offmileage = offmileage;
    }

    public Object getOffoilmass() {
        return offoilmass;
    }

    public void setOffoilmass(Object offoilmass) {
        this.offoilmass = offoilmass;
    }

    public String getOfflocation() {
        return offlocation;
    }

    public void setOfflocation(String offlocation) {
        this.offlocation = offlocation;
    }

}