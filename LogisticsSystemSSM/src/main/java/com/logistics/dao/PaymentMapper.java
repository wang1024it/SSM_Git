package com.logistics.dao;

import java.util.List;

import com.logistics.po.Payment;

public interface PaymentMapper {
	int deleteByPrimaryKey(Integer paymentid);

	int insert(Payment record);

	int insertSelective(Payment record);

	Payment selectByPrimaryKey(Integer paymentid);

	int updateByPrimaryKeySelective(Payment record);

	int updateByPrimaryKey(Payment record);

	public List<Payment> findAll();

}