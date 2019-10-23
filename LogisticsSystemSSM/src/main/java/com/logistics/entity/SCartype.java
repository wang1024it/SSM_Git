package com.logistics.entity;

import java.io.Serializable;

/**
 * (SCartype)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public class SCartype implements Serializable {
    private static final long serialVersionUID = -42604431111442919L;
    //车辆类型ID
    private Integer cartypeid;
    //车辆类型名称
    private String cartypename;


    public Integer getCartypeid() {
        return cartypeid;
    }

    public void setCartypeid(Integer cartypeid) {
        this.cartypeid = cartypeid;
    }

    public String getCartypename() {
        return cartypename;
    }

    public void setCartypename(String cartypename) {
        this.cartypename = cartypename;
    }

}