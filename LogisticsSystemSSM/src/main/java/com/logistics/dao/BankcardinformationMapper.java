package com.logistics.dao;

import java.util.List;

import com.logistics.po.Bankcardinformation;

public interface BankcardinformationMapper {
	int deleteByPrimaryKey(Integer bankcardinformationid);

	int insert(Bankcardinformation record);

	int insertSelective(Bankcardinformation record);

	Bankcardinformation selectByPrimaryKey(Integer bankcardinformationid);

	int updateByPrimaryKeySelective(Bankcardinformation record);

	int updateByPrimaryKey(Bankcardinformation record);

	public List<Bankcardinformation> findAllBankCard(Integer userid);
	
	
	
}