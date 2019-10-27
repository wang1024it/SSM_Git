package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CityMapper;
import com.logistics.po.City;
import com.logistics.service.ICityService;

@Transactional
@Service("cityService")
public class CityServiceImpl implements ICityService {
	@Autowired
	CityMapper cityMapper;

	@Override
	public int deleteByPrimaryKey(Integer cityid) {

		return cityMapper.deleteByPrimaryKey(cityid);
	}

	@Override
	public int insert(City record) {

		return cityMapper.insert(record);
	}

	@Override
	public int insertSelective(City record) {

		return cityMapper.insertSelective(record);
	}

	@Override
	public City selectByPrimaryKey(Integer cityid) {

		return cityMapper.selectByPrimaryKey(cityid);
	}

	@Override
	public int updateByPrimaryKeySelective(City record) {

		return cityMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(City record) {

		return cityMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<City> findAll(@SuppressWarnings("rawtypes") Map map) {

		return cityMapper.findAll(map);
	}

}
