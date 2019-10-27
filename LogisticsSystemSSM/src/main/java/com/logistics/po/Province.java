package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Province implements Serializable {
    /**
     * 省份ID
     */
    private Integer proid;

    /**
     * 省份名称
     */
    private String proname;

    private Integer prosort;

    /**
     * 备注
     */
    private String proremark;

    private static final long serialVersionUID = 1L;

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public Integer getProsort() {
        return prosort;
    }

    public void setProsort(Integer prosort) {
        this.prosort = prosort;
    }

    public String getProremark() {
        return proremark;
    }

    public void setProremark(String proremark) {
        this.proremark = proremark;
    }
}