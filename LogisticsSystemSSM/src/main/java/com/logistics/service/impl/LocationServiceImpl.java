package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.LocationMapper;
import com.logistics.po.Location;
import com.logistics.service.ILocationService;
import com.logistics.vo.LocationVo;

@Transactional
@Service("locationService")
public class LocationServiceImpl implements ILocationService {
	@Autowired
	LocationMapper locationMapper;

	@Override
	public int deleteByPrimaryKey(Integer locationid) {

		return locationMapper.deleteByPrimaryKey(locationid);
	}

	@Override
	public int insert(Location record) {

		return locationMapper.insert(record);
	}

	@Override
	public int insertSelective(Location record) {

		return locationMapper.insertSelective(record);
	}

	@Override
	public Location selectByPrimaryKey(Integer locationid) {

		return locationMapper.selectByPrimaryKey(locationid);
	}

	@Override
	public int updateByPrimaryKeySelective(Location record) {

		return locationMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Location record) {

		return locationMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<LocationVo> findPage(@SuppressWarnings("rawtypes") Map map) {

		return locationMapper.findPage(map);
	}

	@Override
	public int getRowTotal(@SuppressWarnings("rawtypes") Map map) {

		return locationMapper.getRowTotal(map);
	}

	@Override
	public Location findLocationSQL(@SuppressWarnings("rawtypes") Map map) {

		return locationMapper.findLocationSQL(map);
	}

}
