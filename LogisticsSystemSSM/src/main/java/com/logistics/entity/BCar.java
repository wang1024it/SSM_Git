package com.logistics.entity;

import java.io.Serializable;

/**
 * (BCar)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BCar implements Serializable {
    private static final long serialVersionUID = -10936107320850516L;
    //车辆ID
    private Integer carid;
    //用户ID
    private Integer userid;
    //状态ID
    private Integer statusid;
    //车辆类型ID
    private Integer cartypeid;
    //车牌号
    private String platenumber;
    //行驶证照片
    private String cardrivinglicensephoto;
    //最大载重
    private String maxload;
    //车厢规格
    private String carriagespecification;
    //私家否
    private Object isprivate;


    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getStatusid() {
        return statusid;
    }

    public void setStatusid(Integer statusid) {
        this.statusid = statusid;
    }

    public Integer getCartypeid() {
        return cartypeid;
    }

    public void setCartypeid(Integer cartypeid) {
        this.cartypeid = cartypeid;
    }

    public String getPlatenumber() {
        return platenumber;
    }

    public void setPlatenumber(String platenumber) {
        this.platenumber = platenumber;
    }

    public String getCardrivinglicensephoto() {
        return cardrivinglicensephoto;
    }

    public void setCardrivinglicensephoto(String cardrivinglicensephoto) {
        this.cardrivinglicensephoto = cardrivinglicensephoto;
    }

    public String getMaxload() {
        return maxload;
    }

    public void setMaxload(String maxload) {
        this.maxload = maxload;
    }

    public String getCarriagespecification() {
        return carriagespecification;
    }

    public void setCarriagespecification(String carriagespecification) {
        this.carriagespecification = carriagespecification;
    }

    public Object getIsprivate() {
        return isprivate;
    }

    public void setIsprivate(Object isprivate) {
        this.isprivate = isprivate;
    }

}