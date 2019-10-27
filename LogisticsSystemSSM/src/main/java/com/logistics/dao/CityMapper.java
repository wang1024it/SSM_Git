package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.City;

public interface CityMapper {
	int deleteByPrimaryKey(Integer cityid);

	int insert(City record);

	int insertSelective(City record);

	City selectByPrimaryKey(Integer cityid);

	int updateByPrimaryKeySelective(City record);

	int updateByPrimaryKey(City record);

	public List<City> findAll(@SuppressWarnings("rawtypes") Map map);
}