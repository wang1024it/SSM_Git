package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Information implements Serializable {
    /**
     * 资讯ID
     */
    private Integer informationid;

    /**
     * 资讯图片
     */
    private String informationpicture;

    /**
     * 资讯内容
     */
    private String informationcontent;

    /**
     * 是否启用
     */
    private Boolean isenableno;

    private static final long serialVersionUID = 1L;

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

    public Boolean getIsenableno() {
        return isenableno;
    }

    public void setIsenableno(Boolean isenableno) {
        this.isenableno = isenableno;
    }
}