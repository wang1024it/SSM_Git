package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Module implements Serializable {
    /**
     * 模块ID
     */
    private Integer moduleid;

    /**
     * 模块名称
     */
    private String modulename;

    /**
     * 模块路径
     */
    private String moduleurl;

    private static final long serialVersionUID = 1L;

    public Integer getModuleid() {
        return moduleid;
    }

    public void setModuleid(Integer moduleid) {
        this.moduleid = moduleid;
    }

    public String getModulename() {
        return modulename;
    }

    public void setModulename(String modulename) {
        this.modulename = modulename;
    }

    public String getModuleurl() {
        return moduleurl;
    }

    public void setModuleurl(String moduleurl) {
        this.moduleurl = moduleurl;
    }
}