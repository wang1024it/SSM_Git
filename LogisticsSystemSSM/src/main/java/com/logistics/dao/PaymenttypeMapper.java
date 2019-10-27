package com.logistics.dao;

import com.logistics.po.Paymenttype;

public interface PaymenttypeMapper {
    int deleteByPrimaryKey(Integer paymenttypeid);

    int insert(Paymenttype record);

    int insertSelective(Paymenttype record);

    Paymenttype selectByPrimaryKey(Integer paymenttypeid);

    int updateByPrimaryKeySelective(Paymenttype record);

    int updateByPrimaryKey(Paymenttype record);
}