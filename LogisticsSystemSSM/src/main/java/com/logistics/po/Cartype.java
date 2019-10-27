package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Cartype implements Serializable {
    /**
     * 车辆类型ID
     */
    private Integer cartypeid;

    /**
     * 车辆类型名称
     */
    private String cartypename;

    private static final long serialVersionUID = 1L;

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