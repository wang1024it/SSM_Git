package com.logistics.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.UsertypedetailMapper;
import com.logistics.po.Usertypedetail;
import com.logistics.service.IUsertypedetailService;

@Transactional
@Service("usertypedetailService")
public class UsertypedetailServiceImpl implements IUsertypedetailService {
	@Autowired
	UsertypedetailMapper usertypedetailMapper;

	@Override
	public int deleteByPrimaryKey(Integer usertypedetailid) {

		return usertypedetailMapper.deleteByPrimaryKey(usertypedetailid);
	}

	@Override
	public int insert(Usertypedetail record) {

		return usertypedetailMapper.insert(record);
	}

	@Override
	public int insertSelective(Usertypedetail record) {

		return usertypedetailMapper.insertSelective(record);
	}

	@Override
	public Usertypedetail selectByPrimaryKey(Integer usertypedetailid) {

		return usertypedetailMapper.selectByPrimaryKey(usertypedetailid);
	}

	@Override
	public int updateByPrimaryKeySelective(Usertypedetail record) {

		return usertypedetailMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Usertypedetail record) {

		return usertypedetailMapper.updateByPrimaryKey(record);
	}

}
