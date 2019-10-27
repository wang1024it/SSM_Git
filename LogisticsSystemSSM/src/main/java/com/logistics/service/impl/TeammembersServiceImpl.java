package com.logistics.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.TeammembersMapper;
import com.logistics.po.Teammembers;
import com.logistics.service.ITeammembersService;

@Transactional
@Service("teammembersService")
public class TeammembersServiceImpl implements ITeammembersService {
	@Autowired
	TeammembersMapper teammembersMapper;

	@Override
	public int deleteByPrimaryKey(Integer teammembersid) {

		return teammembersMapper.deleteByPrimaryKey(teammembersid);
	}

	@Override
	public int insert(Teammembers record) {

		return teammembersMapper.insert(record);
	}

	@Override
	public int insertSelective(Teammembers record) {

		return teammembersMapper.insertSelective(record);
	}

	@Override
	public Teammembers selectByPrimaryKey(Integer teammembersid) {

		return teammembersMapper.selectByPrimaryKey(teammembersid);
	}

	@Override
	public int updateByPrimaryKeySelective(Teammembers record) {

		return teammembersMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Teammembers record) {

		return teammembersMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Teammembers findBySQL(Map map) {

		return teammembersMapper.findBySQL(map);
	}

}
