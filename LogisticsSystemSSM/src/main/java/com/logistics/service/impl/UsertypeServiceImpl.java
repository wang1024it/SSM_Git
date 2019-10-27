package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.UsertypeMapper;
import com.logistics.po.Usertype;
import com.logistics.service.IUsertypeService;

@Transactional
@Service("usertypeService")
public class UsertypeServiceImpl implements IUsertypeService {
	@Autowired
	UsertypeMapper usertypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer usertypeid) {

		return usertypeMapper.deleteByPrimaryKey(usertypeid);
	}

	@Override
	public int insert(Usertype record) {

		return usertypeMapper.insert(record);
	}

	@Override
	public int insertSelective(Usertype record) {

		return usertypeMapper.insertSelective(record);
	}

	@Override
	public Usertype selectByPrimaryKey(Integer usertypeid) {

		return usertypeMapper.selectByPrimaryKey(usertypeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Usertype record) {

		return usertypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Usertype record) {

		return usertypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Usertype> findAll() {

		return usertypeMapper.findAll();
	}
}
