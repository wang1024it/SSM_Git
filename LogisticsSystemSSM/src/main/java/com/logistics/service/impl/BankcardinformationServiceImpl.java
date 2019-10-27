package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.BankcardinformationMapper;
import com.logistics.po.Bankcardinformation;
import com.logistics.service.IBankcardinformationService;

@Transactional
@Service("bankcardinformationService")
public class BankcardinformationServiceImpl implements
		IBankcardinformationService {
	@Autowired
	BankcardinformationMapper bankcardinformationMapper;

	@Override
	public int deleteByPrimaryKey(Integer bankcardinformationid) {

		return bankcardinformationMapper
				.deleteByPrimaryKey(bankcardinformationid);
	}

	@Override
	public int insert(Bankcardinformation record) {

		return bankcardinformationMapper.insert(record);
	}

	@Override
	public int insertSelective(Bankcardinformation record) {

		return bankcardinformationMapper.insertSelective(record);
	}

	@Override
	public Bankcardinformation selectByPrimaryKey(Integer bankcardinformationid) {

		return bankcardinformationMapper
				.selectByPrimaryKey(bankcardinformationid);
	}

	@Override
	public int updateByPrimaryKeySelective(Bankcardinformation record) {

		return bankcardinformationMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Bankcardinformation record) {

		return bankcardinformationMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Bankcardinformation> findAllBankCard(Integer userid) {

		return bankcardinformationMapper.findAllBankCard(userid);
	}

}
