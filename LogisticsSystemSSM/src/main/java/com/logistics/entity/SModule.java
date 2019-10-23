package com.logistics.entity;

import java.io.Serializable;

/**
 * (SModule)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public class SModule implements Serializable {
    private static final long serialVersionUID = -14827555378921025L;
    //模块ID
    private Integer moduleid;
    //模块名称
    private String modulename;
    //模块路径
    private String moduleurl;


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