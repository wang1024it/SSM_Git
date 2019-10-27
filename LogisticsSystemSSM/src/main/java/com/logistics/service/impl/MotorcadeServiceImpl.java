package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.MotorcadeMapper;
import com.logistics.po.Motorcade;
import com.logistics.service.IMotorcadeService;

@Transactional
@Service("motorcadeService")
public class MotorcadeServiceImpl implements IMotorcadeService {
	@Autowired
	MotorcadeMapper motorcadeMapper;

	@Override
	public int deleteByPrimaryKey(Integer motorcadeid) {

		return motorcadeMapper.deleteByPrimaryKey(motorcadeid);
	}

	@Override
	public int insert(Motorcade record) {

		return motorcadeMapper.insert(record);
	}

	@Override
	public int insertSelective(Motorcade record) {

		return motorcadeMapper.insertSelective(record);
	}

	@Override
	public Motorcade selectByPrimaryKey(Integer motorcadeid) {

		return motorcadeMapper.selectByPrimaryKey(motorcadeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Motorcade record) {

		return motorcadeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Motorcade record) {

		return motorcadeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Motorcade> findAll() {

		return motorcadeMapper.findAll();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Motorcade> findBySQL(Map map) {

		return motorcadeMapper.findBySQL(map);
	}

}
