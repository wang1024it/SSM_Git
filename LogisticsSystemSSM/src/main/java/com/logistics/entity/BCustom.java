package com.logistics.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (BCustom)实体类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public class BCustom implements Serializable {
    private static final long serialVersionUID = 822741529996806988L;
    //客户ID
    private Integer customid;
    //客户类型ID
    private Integer customertypeid;
    //客户名称
    private String customname;
    //密码
    private String custompassword;
    //客户手机号码
    private String customphonenumber;
    //性别
    private String sex;
    //客户身份证号码
    private String customidnumber;
    //客户身份证照片
    private String customidphoto;
    //客户昵称
    private String customerusername;
    //QQ号码
    private String qq;
    //邮箱
    private String mailbox;
    //注册日期
    private Date registrationdate;
    //电话号码
    private String telephonenumber;
    //营业执照
    private String businesslicense;
    //营业执照注册号码
    private String businesslicensenumber;
    //法人代表
    private String corporaterepresentative;
    //公司地址
    private String companyadress;


    public Integer getCustomid() {
        return customid;
    }

    public void setCustomid(Integer customid) {
        this.customid = customid;
    }

    public Integer getCustomertypeid() {
        return customertypeid;
    }

    public void setCustomertypeid(Integer customertypeid) {
        this.customertypeid = customertypeid;
    }

    public String getCustomname() {
        return customname;
    }

    public void setCustomname(String customname) {
        this.customname = customname;
    }

    public String getCustompassword() {
        return custompassword;
    }

    public void setCustompassword(String custompassword) {
        this.custompassword = custompassword;
    }

    public String getCustomphonenumber() {
        return customphonenumber;
    }

    public void setCustomphonenumber(String customphonenumber) {
        this.customphonenumber = customphonenumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCustomidnumber() {
        return customidnumber;
    }

    public void setCustomidnumber(String customidnumber) {
        this.customidnumber = customidnumber;
    }

    public String getCustomidphoto() {
        return customidphoto;
    }

    public void setCustomidphoto(String customidphoto) {
        this.customidphoto = customidphoto;
    }

    public String getCustomerusername() {
        return customerusername;
    }

    public void setCustomerusername(String customerusername) {
        this.customerusername = customerusername;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox;
    }

    public Date getRegistrationdate() {
        return registrationdate;
    }

    public void setRegistrationdate(Date registrationdate) {
        this.registrationdate = registrationdate;
    }

    public String getTelephonenumber() {
        return telephonenumber;
    }

    public void setTelephonenumber(String telephonenumber) {
        this.telephonenumber = telephonenumber;
    }

    public String getBusinesslicense() {
        return businesslicense;
    }

    public void setBusinesslicense(String businesslicense) {
        this.businesslicense = businesslicense;
    }

    public String getBusinesslicensenumber() {
        return businesslicensenumber;
    }

    public void setBusinesslicensenumber(String businesslicensenumber) {
        this.businesslicensenumber = businesslicensenumber;
    }

    public String getCorporaterepresentative() {
        return corporaterepresentative;
    }

    public void setCorporaterepresentative(String corporaterepresentative) {
        this.corporaterepresentative = corporaterepresentative;
    }

    public String getCompanyadress() {
        return companyadress;
    }

    public void setCompanyadress(String companyadress) {
        this.companyadress = companyadress;
    }

}