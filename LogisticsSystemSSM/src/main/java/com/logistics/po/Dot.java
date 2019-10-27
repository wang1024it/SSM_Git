package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Dot implements Serializable {
    /**
     * 网点ID
     */
    private Integer dotid;

    /**
     * 网点名称
     */
    private String dotname;

    /**
     * 地址
     */
    private String adress;

    /**
     * 电话
     */
    private String tlephone;

    /**
     * 网点管理人ID
     */
    private Integer dotadministratorid;

    /**
     * 邮箱
     */
    private String milbox;

    /**
     * 所在的市区ID
     */
    private Integer disid;

    private static final long serialVersionUID = 1L;

    public Integer getDotid() {
        return dotid;
    }

    public void setDotid(Integer dotid) {
        this.dotid = dotid;
    }

    public String getDotname() {
        return dotname;
    }

    public void setDotname(String dotname) {
        this.dotname = dotname;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getTlephone() {
        return tlephone;
    }

    public void setTlephone(String tlephone) {
        this.tlephone = tlephone;
    }

    public Integer getDotadministratorid() {
        return dotadministratorid;
    }

    public void setDotadministratorid(Integer dotadministratorid) {
        this.dotadministratorid = dotadministratorid;
    }

    public String getMilbox() {
        return milbox;
    }

    public void setMilbox(String milbox) {
        this.milbox = milbox;
    }

    public Integer getDisid() {
        return disid;
    }

    public void setDisid(Integer disid) {
        this.disid = disid;
    }
}