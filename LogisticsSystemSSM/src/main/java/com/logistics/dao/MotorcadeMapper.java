package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Motorcade;

public interface MotorcadeMapper {
	int deleteByPrimaryKey(Integer motorcadeid);

	int insert(Motorcade record);

	int insertSelective(Motorcade record);

	Motorcade selectByPrimaryKey(Integer motorcadeid);

	int updateByPrimaryKeySelective(Motorcade record);

	int updateByPrimaryKey(Motorcade record);

	public List<Motorcade> findAll();

	@SuppressWarnings("rawtypes")
	public List<Motorcade> findBySQL(Map map);

}