package com.logistics.po;

import java.io.Serializable;

/**
 * @author 
 */
public class Bankcardinformation implements Serializable {
    /**
     * 银行卡信息ID
     */
    private Integer bankcardinformationid;

    /**
     * 用户ID
     */
    private Integer userid;

    /**
     * 银行卡号
     */
    private String bankcardnumber;

    /**
     * 银行卡预留手机号码
     */
    private String bankcardreservedphonenumber;

    private static final long serialVersionUID = 1L;

    public Integer getBankcardinformationid() {
        return bankcardinformationid;
    }

    public void setBankcardinformationid(Integer bankcardinformationid) {
        this.bankcardinformationid = bankcardinformationid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getBankcardnumber() {
        return bankcardnumber;
    }

    public void setBankcardnumber(String bankcardnumber) {
        this.bankcardnumber = bankcardnumber;
    }

    public String getBankcardreservedphonenumber() {
        return bankcardreservedphonenumber;
    }

    public void setBankcardreservedphonenumber(String bankcardreservedphonenumber) {
        this.bankcardreservedphonenumber = bankcardreservedphonenumber;
    }
}