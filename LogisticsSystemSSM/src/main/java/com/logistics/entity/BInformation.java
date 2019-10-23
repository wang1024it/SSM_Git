package com.logistics.entity;

import java.io.Serializable;

/**
 * (BInformation)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BInformation implements Serializable {
    private static final long serialVersionUID = -43156122068965820L;
    //资讯ID
    private Integer informationid;
    //资讯图片
    private String informationpicture;
    //资讯内容
    private String informationcontent;
    //是否启用
    private Object isenableno;


    public Integer getInformationid() {
        return informationid;
    }

    public void setInformationid(Integer informationid) {
        this.informationid = informationid;
    }

    public String getInformationpicture() {
        return informationpicture;
    }

    public void setInformationpicture(String informationpicture) {
        this.informationpicture = informationpicture;
    }

    public String getInformationcontent() {
        return informationcontent;
    }

    public void setInformationcontent(String informationcontent) {
        this.informationcontent = informationcontent;
    }

    public Object getIsenableno() {
        return isenableno;
    }

    public void setIsenableno(Object isenableno) {
        this.isenableno = isenableno;
    }

}