package com.logistics.service;

import java.util.List;

import com.logistics.po.Bankcardinformation;

public interface IBankcardinformationService {
	int deleteByPrimaryKey(Integer bankcardinformationid);

	int insert(Bankcardinformation record);

	int insertSelective(Bankcardinformation record);

	Bankcardinformation selectByPrimaryKey(Integer bankcardinformationid);

	int updateByPrimaryKeySelective(Bankcardinformation record);

	int updateByPrimaryKey(Bankcardinformation record);

	public List<Bankcardinformation> findAllBankCard(Integer userid);

}
