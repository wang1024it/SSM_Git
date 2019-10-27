package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CustomertypeMapper;
import com.logistics.po.Customertype;
import com.logistics.service.ICustomertypeService;

@Transactional
@Service("customertypeService")
public class CustomertypeServiceImpl implements ICustomertypeService {
	@Autowired
	CustomertypeMapper customertypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer customertypeid) {

		return customertypeMapper.deleteByPrimaryKey(customertypeid);

	}

	@Override
	public int insert(Customertype record) {

		return customertypeMapper.insert(record);
	}

	@Override
	public int insertSelective(Customertype record) {

		return customertypeMapper.insertSelective(record);
	}

	@Override
	public Customertype selectByPrimaryKey(Integer customertypeid) {

		return customertypeMapper.selectByPrimaryKey(customertypeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Customertype record) {

		return customertypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Customertype record) {

		return customertypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Customertype> findAll() {

		return customertypeMapper.findAll();
	}

}
