package com.logistics.dao;

import java.util.List;

import com.logistics.po.Billingmethod;

public interface BillingmethodMapper {
	int deleteByPrimaryKey(Integer billingmethodid);

	int insert(Billingmethod record);

	int insertSelective(Billingmethod record);

	Billingmethod selectByPrimaryKey(Integer billingmethodid);

	int updateByPrimaryKeySelective(Billingmethod record);

	int updateByPrimaryKey(Billingmethod record);

	public List<Billingmethod> findAll();
}